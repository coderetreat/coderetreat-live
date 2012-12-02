require 'spec_helper'

describe CoderetreatsController do
  describe "GET /todays_running" do
    let(:coderetreats_lookup) { stub }
    let(:coderetreats) { stub(:empty? => true) }

    before do
      stub_const("CoderetreatLive::Coderetreats", coderetreats_lookup)
      coderetreats_lookup.stub(:running_today) { coderetreats }
    end

    it "assigns the todays_running coderetreats to coderetreats" do
      get :todays_running
      assigns[:coderetreats].should == coderetreats
    end

    context "some coderetreats running today" do
      it "renders running" do
        coderetreats.stub(:empty? => false)

        get :todays_running
        response.should have_rendered("running")
      end
    end

    context "no coderetreats running today" do
      it "renders running_no_coderetreats"
    end
  end
end
