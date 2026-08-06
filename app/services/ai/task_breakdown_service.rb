module Ai
  class TaskBreakdownService

    def self.call(task)
      new(task).call
    end

    def initialize(task)
      @task = task
    end


    def call
      response = GeminiClient.generate(prompt)

      create_steps(response)
    end


    private

    def create_steps(response)
      response["steps"].each_with_index do |step, index|
        @task.task_steps.create!(
          title: step["title"],
          estimated_minutes: step["minutes"],
          position: index + 1
        )
      end
    end

  end
end