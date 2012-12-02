require 'spec_helper'

describe CoderetreatsController do
  describe "GET /todays_running" do
    it "assigns the todays_running coderetreats to coderetreats" do
      coderetreats_lookup = stub
      stub_const("CoderetreatLive::Coderetreats", coderetreats_lookup)

      coderetreats = stub
      coderetreats_lookup.stub(:running_today) { coderetreats }

      get :todays_running

      assigns[:coderetreats].should == coderetreats
    end
  end
end
