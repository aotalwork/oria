require 'rails_helper'

RSpec.describe "Ai::Routines", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/routines/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/routines/create"
      expect(response).to have_http_status(:success)
    end
  end

end
