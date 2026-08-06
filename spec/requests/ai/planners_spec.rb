require 'rails_helper'

RSpec.describe "Ai::Planners", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/planners/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/planners/create"
      expect(response).to have_http_status(:success)
    end
  end

end
