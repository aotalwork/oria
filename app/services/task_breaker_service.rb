class TaskBreakerService
  def initialize(client = GEMINI_CLIENT)
    @client = client
  end

  def call(task)
    prompt = PromptBuilder.task_breaker(task)

    @client.generate(prompt)
  end
end