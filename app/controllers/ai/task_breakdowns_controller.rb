module Ai
  class TaskBreakdownsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: %i[show edit update destroy]


    def index
      @tasks = current_user.tasks.order(priority: :desc).order(title: :asc)
    end


    def show
      @breakdown = @task.ai_task_breakdown
    end


    def new
      @task = current_user.tasks.new
    end


    def create
      @task = current_user.tasks.new(task_params)

      if @task.save

        ai_result = GeminiClient.call(
          prompt: <<~PROMPT
        Eres ORIA, un asistente de productividad.

        Divide esta tarea en pasos pequeños:

        Título:
        #{@task.title}

        Descripción:
        #{@task.description}

        Devuelve:
        1. Primer paso de menos de 2 minutos
        2. Pasos siguientes
        3. Tiempo estimado
        4. Consejos para terminarla
      PROMPT
        )


        @task.create_ai_task_breakdown!(
          response: ai_result.to_json
        )


        redirect_to ai_task_breakdown_path(@task),
                    notice: "Tarea dividida correctamente."

      else
        render :new, status: :unprocessable_entity
      end
    end


    def edit
    end


    def update
      if @task.update(task_params)

        redirect_to ai_task_breakdowns_path,
                    notice: "Tarea actualizada."

      else

        render :edit, status: :unprocessable_entity

      end
    end


    def destroy
      @task.destroy

      redirect_to ai_task_breakdowns_path,
                  notice: "Tarea eliminada."
    end


    private


    def set_task
      @task = current_user.tasks.find(params[:id])
    end


    def task_params
      params.require(:task).permit(
        :title,
        :description,
        :status,
        :priority,
        :estimated_minutes,
        :due_date
      )
    end

  end
end