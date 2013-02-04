require 'spec_helper'

describe "AccountServices" do
  describe "it should retrieve a Strava user" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      service = StravaService.new()
      service.get_user('matthew.holloway@logicwerx.com', 'S4mpl3').should_not be_nil
    end
  end
end
