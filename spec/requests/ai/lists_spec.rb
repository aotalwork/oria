require 'rails_helper'

RSpec.describe "Ai::Lists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/lists/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/lists/create"
      expect(response).to have_http_status(:success)
    end
  end

end
