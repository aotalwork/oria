require 'rails_helper'

RSpec.describe "Ai::Procrastinations", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/procrastinations/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/procrastinations/create"
      expect(response).to have_http_status(:success)
    end
  end

end
