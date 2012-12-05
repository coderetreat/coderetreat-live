require 'spec_helper'

describe Admin::CoderetreatSessionsController do
  describe "POST /create" do
    let(:session_manager) { stub }
    let(:coderetreat) { stub(admin_token: "token") }
    before do
      stub_const("CoderetreatLive::Coderetreats::Sessions", session_manager)
    end
    it "adds a session to the coderetreat" do
      session_manager.should_receive(:start_new_session_for).with("token", {"constraint" => "my constraint"})
      post :create, coderetreat_id: "token", session: {constraint: "my constraint"}
    end
  end
end
