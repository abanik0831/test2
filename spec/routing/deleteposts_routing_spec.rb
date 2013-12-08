require "spec_helper"

describe DeletepostsController do
  describe "routing" do

    it "routes to #index" do
      get("/deleteposts").should route_to("deleteposts#index")
    end

    it "routes to #new" do
      get("/deleteposts/new").should route_to("deleteposts#new")
    end

    it "routes to #show" do
      get("/deleteposts/1").should route_to("deleteposts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/deleteposts/1/edit").should route_to("deleteposts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/deleteposts").should route_to("deleteposts#create")
    end

    it "routes to #update" do
      put("/deleteposts/1").should route_to("deleteposts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/deleteposts/1").should route_to("deleteposts#destroy", :id => "1")
    end

  end
end
