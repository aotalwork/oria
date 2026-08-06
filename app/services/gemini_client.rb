# app/services/gemini_client.rb

require "faraday"
require "json"

class GeminiClient
  MODEL = ENV.fetch("GEMINI_MODEL", "gemini-3.1-flash-lite").freeze

  def self.call(prompt:)
    new.generate(prompt)
  end

  def self.list_models
    new.list_models
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

    Rails.logger.info "GEMINI STATUS: #{response.status}"
    Rails.logger.info "GEMINI BODY: #{response.body}"

    json = JSON.parse(response.body)

    unless response.success?
      raise "Gemini API error: #{json.dig("error", "message")}"
    end

    text = json.dig(
      "candidates",
      0,
      "content",
      "parts"
    )&.map { |part| part["text"] }&.join("\n")

    Rails.logger.info "GEMINI RESPONSE: #{text.inspect}"

    text
  end

  def list_models
    response = Faraday.get(
      "https://generativelanguage.googleapis.com/v1beta/models?key=#{@api_key}"
    )

    Rails.logger.info "AVAILABLE MODELS:"
    Rails.logger.info JSON.pretty_generate(JSON.parse(response.body))

    JSON.parse(response.body)
  end
end