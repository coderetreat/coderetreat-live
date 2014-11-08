require 'spec_helper'

describe CoderetreatsController, type: :controller do
  describe "GET /running_today" do
    let(:coderetreats_lookup) { double }
    let(:coderetreats) { double(:empty? => true) }

    before do
      stub_const("CoderetreatLive::Coderetreats", coderetreats_lookup)
      coderetreats_lookup.stub(:running_today) { coderetreats }
    end

    it "assigns the running_today coderetreats to coderetreats" do
      get :running_today
      assigns[:coderetreats].should == coderetreats
    end

    context "some coderetreats running today" do
      it "renders running" do
        coderetreats.stub(:empty? => false)

        get :running_today
        response.should have_rendered("running")
      end
    end

    context "no coderetreats running today" do
      it "renders running_no_coderetreats" do
        coderetreats.stub(:empty? => true)

        get :running_today
        response.should have_rendered("none_running")
      end
    end
  end
end
