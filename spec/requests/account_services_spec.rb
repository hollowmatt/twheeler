require 'spec_helper'

describe "AccountServices" do

  before (:each) do
    @service = StravaService.new()
  end

  before (:all) do
    @user = User.new()
  end

  describe "Happy Path" do
    it "it should retrieve a Strava user" do
      #response = @service.get_user('matthew.holloway@logicwerx.com', 'S4mpl3')
      response = @service.get_user('hollowmatt@gmail.com', 'sheila11')
      response.status.should == 200
      @user.email = response.email
      @user.user_id = response.user_id
      #@user.email.should == 'matthew.holloway@logicwerx.com'
    end

    it "should retrieve rides from a valid user" do
      response = @service.get_rides(@user.user_id)
      response.should_not be_nil
    end
  end

  describe "Sad Path" do
  	it "should pass status 401 without a valid user" do
  		response = @service.get_user('nota@user.com', 'invalid')
  		response.status.should == 401
  	end
  end
end