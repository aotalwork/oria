require 'rails_helper'

RSpec.describe "Ai::TextSimplifiers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/text_simplifiers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/text_simplifiers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
