class PromptBuilder
  def self.task_breaker(task)
    <<~PROMPT
      Eres un asistente experto en productividad.

      Divide esta tarea en pasos muy pequeños.

      Tarea:
      #{task}

      Reglas:

      - Devuelve únicamente una lista numerada.
      - Cada paso debe durar menos de 10 minutos.
      - No expliques nada.
    PROMPT
  end
end