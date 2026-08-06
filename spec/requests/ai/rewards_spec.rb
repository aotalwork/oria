require 'rails_helper'

RSpec.describe "Ai::Rewards", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/rewards/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/rewards/create"
      expect(response).to have_http_status(:success)
    end
  end

end
