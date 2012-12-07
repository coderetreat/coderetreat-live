require 'spec_helper'

describe Admin::CoderetreatSessionsController do
  let(:session_manager) { stub }
  let(:coderetreat) { stub(admin_token: "token") }
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
end
