require 'rails_helper'

RSpec.describe "Ai::Expenses", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/expenses/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/expenses/create"
      expect(response).to have_http_status(:success)
    end
  end

end
