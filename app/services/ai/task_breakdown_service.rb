module Ai
  class TaskBreakdownService
    def self.call(task)
      new(task).call
    end

    def initialize(task)
      @task = task
    end

    def call
      response = GeminiClient.call(
        prompt: PromptBuilder.task_breaker(
          "#{@task.title}\n#{@task.description}"
        )
      )

      data = JSON.parse(response)

      validate_response!(data)

      ActiveRecord::Base.transaction do
        @task.task_steps.destroy_all

        create_steps(data)
      end

      data
    end

    private

    def validate_response!(data)
      steps = data["steps"]

      unless steps.is_a?(Array) && steps.any?
        raise "Gemini no devolvió pasos válidos"
      end

      steps.each do |step|
        %w[position title description estimated_minutes].each do |key|
          unless step.key?(key)
            raise "Respuesta de Gemini incompleta: falta #{key}"
          end
        end
      end
    end

    def create_steps(data)
      data.fetch("steps").each do |step|
        @task.task_steps.create!(
          position: step.fetch("position"),
          title: step.fetch("title"),
          description: step.fetch("description"),
          estimated_minutes: step.fetch("estimated_minutes")
        )
      end
    end
  end
end