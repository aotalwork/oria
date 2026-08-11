module Ai
  class ProcrastinationService
    def self.call(procrastination)
      new(procrastination).call
    end

    def initialize(procrastination)
      @procrastination = procrastination
    end

    def call
      response = GeminiClient.call(
        prompt: PromptBuilder.procrastination(
          @procrastination.task
        )
      )

      data = JSON.parse(response)

      validate_response!(data)

      @procrastination.update!(
        first_step: data.fetch("first_step"),
        estimated_minutes: data.fetch("estimated_minutes"),
        motivation: data.fetch("motivation"),
        blocker_plan: data.fetch("blocker_plan")
      )

      data
    end

    private

    def validate_response!(data)
      required_keys = %w[
        first_step
        estimated_minutes
        motivation
        blocker_plan
      ]

      required_keys.each do |key|
        unless data.key?(key)
          raise "Respuesta de Gemini incompleta: falta #{key}"
        end
      end

      unless data["first_step"].is_a?(String) &&
             data["first_step"].strip != ""
        raise "Respuesta de Gemini inválida: first_step debe ser un texto"
      end

      unless data["estimated_minutes"].is_a?(Integer) &&
             data["estimated_minutes"].between?(1, 2)
        raise "Respuesta de Gemini inválida: estimated_minutes debe ser un entero entre 1 y 2"
      end

      unless data["motivation"].is_a?(String) &&
             data["motivation"].strip != ""
        raise "Respuesta de Gemini inválida: motivation debe ser un texto"
      end

      unless data["blocker_plan"].is_a?(String) &&
             data["blocker_plan"].strip != ""
        raise "Respuesta de Gemini inválida: blocker_plan debe ser un texto"
      end
    end
  end
end