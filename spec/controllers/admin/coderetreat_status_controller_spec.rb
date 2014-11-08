require 'spec_helper'

describe Admin::CoderetreatStatusController, type: :controller do
  let(:coderetreat_lookup) { double }
  let(:coderetreat) { double(admin_token: "token") }
  before do
    stub_const("CoderetreatLive::Coderetreats", coderetreat_lookup)
  end

  describe "GET /manage_status" do
    it "uses the :id as the admin_token to look up and assign the coderetreat" do
      coderetreat_lookup.stub(:for_admin_token).with("token") { coderetreat }
      get :edit, coderetreat_id: "token"
      assigns[:coderetreat].should == coderetreat
    end
  end

  describe "PUT /update_status" do
    it "updates the status to the passed in parameter" do
      coderetreat_lookup.should_receive(:update_status).with("token", "new_status") { coderetreat }
      put :update, coderetreat_id: "token", status: "new_status"
    end
  end
end
