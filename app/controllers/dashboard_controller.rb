class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @tools = [
      {
        icon: "🧠",
        title: "Divisor de tareas",
        description: "Convierte tareas grandes en pequeños pasos.",
        path: tasks_path
      },
      {
        icon: "📅",
        title: "Planificador",
        description: "Organiza automáticamente tu día."
      },
      {
        icon: "🍅",
        title: "Pomodoro",
        description: "Sesiones inteligentes de concentración."
      },
      {
        icon: "📖",
        title: "Simplificador",
        description: "Resume cualquier texto."
      },
      {
        icon: "🎯",
        title: "Priorizador",
        description: "Decide qué hacer primero."
      },
      {
        icon: "💬",
        title: "Mensajes",
        description: "Redacta emails y mensajes."
      },
      {
        icon: "📚",
        title: "Estudio",
        description: "Flashcards y resúmenes."
      },
      {
        icon: "🔔",
        title: "Rutinas",
        description: "Crea hábitos diarios."
      },
      {
        icon: "💰",
        title: "Gastos",
        description: "Clasifica tus gastos."
      },
      {
        icon: "😴",
        title: "Sueño",
        description: "Analiza tus hábitos."
      },
      {
        icon: "🎉",
        title: "Recompensas",
        description: "Celebra cada logro."
      },
      {
        icon: "🧘",
        title: "Coach",
        description: "Reduce el estrés y la sobrecarga."
      }
    ]
  end
end