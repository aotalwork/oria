require 'rails_helper'

RSpec.describe "Ai::TaskBreakdowns", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/ai/task_breakdowns/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/ai/task_breakdowns/create"
      expect(response).to have_http_status(:success)
    end
  end

end
