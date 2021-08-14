require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :routing do
  describe "routing" do
    xit "routes to #index" do
      expect(:get => "/api/v1/users").to route_to("api/v1/users#index")
    end

    xit "routes to #show" do
      expect(:get => "/api/v1/users/1").to route_to("api/v1/users#show", :id => "1")
    end


    xit "routes to #create" do
      expect(:post => "/api/v1/users").to route_to("api/v1/users#create")
    end

    xit "routes to #update via PUT" do
      expect(:put => "/api/v1/users/1").to route_to("api/v1/users#update", :id => "1")
    end

    xit "routes to #update via PATCH" do
      expect(:patch => "/api/v1/users/1").to route_to("api/v1/users#update", :id => "1")
    end

    xit "routes to #destroy" do
    #  expect(:delete => "/api/v1/users/1").to route_to("format"=>:json, "api/v1/users#destroy", :id => "1")
    end
  end
end
