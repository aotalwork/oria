class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index

    @tools = [
      {
        icon: "🧠",
        title: "Divisor de tareas",
        description: "Convierte tareas grandes en pequeños pasos.",
        path: ai_task_breakdowns_path
      },
      {
        icon: "⏱️",
        title: "Anti procrastinación",
        description: "Encuentra el primer paso para empezar.",
        path: ai_procrastinations_path
      },
      {
        icon: "📅",
        title: "Planificador",
        description: "Organiza automáticamente tu día.",
        path: ai_planners_path
      },
      {
        icon: "🍅",
        title: "Pomodoro",
        description: "Sesiones inteligentes de concentración.",
        path: ai_pomodoros_path
      },
      {
        icon: "📖",
        title: "Simplificador",
        description: "Resume cualquier texto.",
        path: ai_text_simplifiers_path
      },
      {
        icon: "🎯",
        title: "Priorizador",
        description: "Decide qué hacer primero.",
        path: ai_priorities_path
      },
      {
        icon: "💬",
        title: "Mensajes",
        description: "Redacta emails y mensajes.",
        path: ai_messages_path
      },
      {
        icon: "📚",
        title: "Estudio",
        description: "Flashcards y resúmenes.",
        path: ai_study_helpers_path
      },
      {
        icon: "🔔",
        title: "Rutinas",
        description: "Crea hábitos diarios.",
        path: ai_routines_path
      },
      {
        icon: "💰",
        title: "Gastos",
        description: "Clasifica tus gastos.",
        path: ai_expenses_path
      },
      {
        icon: "😴",
        title: "Sueño",
        description: "Analiza tus hábitos.",
        path: ai_sleep_trackers_path
      },
      {
        icon: "🎉",
        title: "Recompensas",
        description: "Celebra cada logro.",
        path: ai_rewards_path
      },
      {
        icon: "🧘",
        title: "Coach",
        description: "Reduce el estrés y la sobrecarga.",
        path: ai_coaches_path
      }
    ]
  end
end