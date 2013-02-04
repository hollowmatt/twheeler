require 'spec_helper'

describe "AccountServices" do
  describe "Happy Path" do
    it "it should retrieve a Strava user" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      service = StravaService.new()
      response = service.get_user('matthew.holloway@logicwerx.com', 'S4mpl3')
      response.status.should == 200
    end
  end

  describe "Sad Path" do
  	it "should pass status 401 without a valid user" do
  		service = StravaService.new()
  		response = service.get_user('nota@user.com', 'invalid')
  		binding.pry
  		response.status.should == 401
  	end
  end
end