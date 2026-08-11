module Ai
  class ProcrastinationsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_procrastination, only: %i[show edit update destroy]

    def index
      @procrastinations = current_user.procrastinations.order(created_at: :desc)
    end

    def show
    end

    def new
      @procrastination = current_user.procrastinations.build
    end

    def edit
    end

    def create
      @procrastination = current_user.procrastinations.build(procrastination_params)

      begin
        prompt = PromptBuilder.procrastination(@procrastination.task)
        response = GeminiClient.call(prompt: prompt)
        result = JSON.parse(response)

        @procrastination.assign_attributes(
          first_step: result["first_step"],
          estimated_minutes: result["estimated_minutes"],
          motivation: result["motivation"],
          blocker_plan: result["blocker_plan"]
        )

        if @procrastination.save
          redirect_to ai_procrastination_path(@procrastination)
        else
          render :new, status: :unprocessable_entity
        end

      rescue JSON::ParserError
        @procrastination.errors.add(
          :base,
          "La IA devolvió una respuesta inválida."
        )

        render :new, status: :unprocessable_entity

      rescue StandardError => e
        Rails.logger.error "PROCRASTINATION ERROR: #{e.class}: #{e.message}"
        Rails.logger.error e.backtrace.join("\n")

        @procrastination.errors.add(
          :base,
          "No se pudo generar la estrategia."
        )

        render :new, status: :unprocessable_entity
      end
    end

    def update
      if @procrastination.update(procrastination_params)
        redirect_to ai_procrastination_path(@procrastination),
                    notice: "Tarea actualizada."
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @procrastination.destroy

      redirect_to ai_procrastinations_path,
                  notice: "Procrastinación eliminada correctamente.",
                  status: :see_other
    end

    private

    def procrastination_params
      params.require(:procrastination).permit(
        :task,
        :first_step,
        :estimated_minutes,
        :motivation,
        :blocker_plan
      )
    end

    def set_procrastination
      @procrastination = current_user.procrastinations.find(params[:id])
    end
  end
end