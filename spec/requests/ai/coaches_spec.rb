require 'rails_helper'

RSpec.describe "Ai::Coaches", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/coaches/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/coaches/create"
      expect(response).to have_http_status(:success)
    end
  end

end
