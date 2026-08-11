module Ai
  class TaskBreakdownsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_task, only: %i[show edit update destroy]

    def index

      @total_tasks = current_user.tasks.count
      @completed_tasks = current_user.tasks.completed.count
      @pending_tasks = current_user.tasks.pending.count

      @tasks = current_user.tasks
                           .order(priority: :desc, title: :asc)
    end

    def show
      @task_steps = @task.task_steps.order(:position)
    end

    def new
      @task = current_user.tasks.new
    end

    def create
      @task = current_user.tasks.new(task_params)

      if @task.save
        Ai::TaskBreakdownService.call(@task)

        redirect_to ai_task_breakdown_path(@task),
                    notice: "Tarea dividida correctamente."
      else
        render :new, status: :unprocessable_entity
      end
    rescue JSON::ParserError, RuntimeError => e
      handle_ai_error(e, :new)
    end

    def edit
    end

    def update
      if @task.update(task_params)
        Ai::TaskBreakdownService.call(@task)

        redirect_to ai_task_breakdown_path(@task),
                    notice: "Tarea actualizada y pasos regenerados con IA."
      else
        render :edit, status: :unprocessable_entity
      end
    rescue JSON::ParserError, RuntimeError => e
      handle_ai_error(e, :edit)
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

    def handle_ai_error(error, template)
      Rails.logger.error(
        "ORIA AI ERROR: #{error.class} - #{error.message}"
      )

      flash.now[:alert] =
        "No hemos podido generar los pasos con IA. " \
          "La tarea no se ha podido procesar."

      render template, status: :unprocessable_entity
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