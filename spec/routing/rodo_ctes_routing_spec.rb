require "spec_helper"

describe RodoCtesController do
  describe "routing" do

    it "routes to #index" do
      get("/rodo_ctes").should route_to("rodo_ctes#index")
    end

    it "routes to #new" do
      get("/rodo_ctes/new").should route_to("rodo_ctes#new")
    end

    it "routes to #show" do
      get("/rodo_ctes/1").should route_to("rodo_ctes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/rodo_ctes/1/edit").should route_to("rodo_ctes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/rodo_ctes").should route_to("rodo_ctes#create")
    end

    it "routes to #update" do
      put("/rodo_ctes/1").should route_to("rodo_ctes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/rodo_ctes/1").should route_to("rodo_ctes#destroy", :id => "1")
    end

  end
end
