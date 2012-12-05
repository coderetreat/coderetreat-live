require 'spec_helper'

describe Admin::CoderetreatsController do
  describe "GET /manage" do
    it "uses the :id as the admin_token to look up and assign the coderetreat" do
      coderetreat_lookup = stub
      stub_const("CoderetreatLive::Coderetreats", coderetreat_lookup)

      coderetreat = stub
      coderetreat_lookup.stub(:for_admin_token).with("token") { coderetreat }
      get :manage, id: "token"
      assigns[:coderetreat].should == coderetreat
    end
  end
end
