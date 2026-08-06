require 'rails_helper'

RSpec.describe "Ai::SleepTrackers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/sleep_trackers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/sleep_trackers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
