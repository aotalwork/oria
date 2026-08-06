require "google/genai"

class GeminiClient
  MODEL = "gemini-2.5-flash".freeze

  def initialize
    @client = Google::GenAI::Client.new(
      api_key: ENV.fetch("GEMINI_API_KEY")
    )
  end

  def generate(prompt)
    response = @client.models.generate_content(
      model: MODEL,
      contents: prompt
    )

    response.text
  end
end