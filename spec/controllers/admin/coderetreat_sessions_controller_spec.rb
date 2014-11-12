require 'spec_helper'

describe Admin::CoderetreatSessionsController, type: :controller do
  let(:session_manager) { double }
  let(:coderetreat) { double(admin_token: "token") }
  before do
    stub_const("CoderetreatLive::Coderetreats::Sessions", session_manager)
  end
  describe "POST /create" do
    it "adds a session to the coderetreat" do
      session_manager.should_receive(:start_new_session_for).with("token", {"constraint" => "my constraint"})
      post :create, coderetreat_id: "token", coderetreat_session: {constraint: "my constraint"}
    end
  end

  describe "DELETE /destroy" do
    it "removes the session from the coderetreat" do
      session_manager.should_receive(:remove_session_from).with("token", "5")
      post :destroy, coderetreat_id: "token", id: "5"
    end
  end

  describe "GET /edit" do
    it "retrieves the coderetreat and session" do
      session = double("session")
      session_manager.stub(:for_coderetreat).with("token", "4") { [session, coderetreat] }

      get :edit, coderetreat_id: "token", id: "4"

      assigns[:coderetreat].should == coderetreat
      assigns[:session].should == session
    end
  end

  describe "PUT /update" do
    it "updates the session for the coderetreat" do
      session_manager.should_receive(:update_session_info_for).with("token", "4", {"constraint" => "new one"})

      put :update, coderetreat_id: "token", id: "4", coderetreat_session: {constraint: "new one"}
    end
  end
end
