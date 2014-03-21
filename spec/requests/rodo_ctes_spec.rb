require 'spec_helper'

describe "RodoCtes" do
  describe "GET /rodo_ctes" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get rodo_ctes_path
      response.status.should be(200)
    end
  end
end
