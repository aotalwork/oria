require "faraday"
require "json"

class GeminiClient
  MODEL = "gemini-2.5-flash".freeze

  def self.call(prompt:)
    new.generate(prompt)
  end

  def initialize
    @api_key = ENV.fetch("GEMINI_API_KEY")
  end

  def generate(prompt)

    response = Faraday.post(
      "https://generativelanguage.googleapis.com/v1beta/models/#{MODEL}:generateContent?key=#{@api_key}"
    ) do |req|
      req.headers["Content-Type"] = "application/json"

      req.body = {
        contents: [
          {
            parts: [
              {
                text: prompt
              }
            ]
          }
        ]
      }.to_json
    end

    json = JSON.parse(response.body)

    json.dig(
      "candidates",
      0,
      "content",
      "parts",
      0,
      "text"
    )
  end
end