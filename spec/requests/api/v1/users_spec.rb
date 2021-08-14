require 'rails_helper'

RSpec.describe "Api::V1::Users", type: :request do
  describe "GET /api/v1/users" do
    it "works! (now write some real specs)" do
      headers = { "ACCEPT" => "application/json" }
      get api_v1_users_path, :headers => headers
      expect(response).to have_http_status(200)
      expect(response.content_type).to eq("application/json; charset=utf-8")
      # expect(response).to have_http_status(:created)
    end
  end
end
