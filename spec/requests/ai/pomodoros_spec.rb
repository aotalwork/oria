require 'rails_helper'

RSpec.describe "Ai::Pomodoros", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/pomodoros/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/pomodoros/create"
      expect(response).to have_http_status(:success)
    end
  end

end
