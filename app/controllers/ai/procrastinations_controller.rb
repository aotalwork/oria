module Ai
class ProcrastinationsController < ApplicationController
  def index
    @procrastinations = Procrastination.order(created_at: :desc)
  end

  def new
    @procrastination = Procrastination.new
  end

  def create
    @procrastination = Procrastination.new(
      task: procrastination_params[:task]
    )

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
        redirect_to @procrastination
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
      Rails.logger.error "PROCRASTINATION ERROR: #{e.message}"

      @procrastination.errors.add(
        :base,
        "No se pudo generar la estrategia."
      )

      render :new, status: :unprocessable_entity
    end
  end

  def show
    @procrastination = Procrastination.find(params[:id])
  end

  private

  def procrastination_params
    params.require(:procrastination).permit(
      :task,
      :first_step,
      :estimated_time,
      :motivation,
      :blocker_plan
    )
  end
end
end