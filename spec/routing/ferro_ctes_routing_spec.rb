require "spec_helper"

describe FerroCtesController do
  describe "routing" do

    it "routes to #index" do
      get("/ferro_ctes").should route_to("ferro_ctes#index")
    end

    it "routes to #new" do
      get("/ferro_ctes/new").should route_to("ferro_ctes#new")
    end

    it "routes to #show" do
      get("/ferro_ctes/1").should route_to("ferro_ctes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ferro_ctes/1/edit").should route_to("ferro_ctes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ferro_ctes").should route_to("ferro_ctes#create")
    end

    it "routes to #update" do
      put("/ferro_ctes/1").should route_to("ferro_ctes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ferro_ctes/1").should route_to("ferro_ctes#destroy", :id => "1")
    end

  end
end
