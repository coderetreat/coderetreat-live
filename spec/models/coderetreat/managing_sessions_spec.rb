require 'active_record_spec_helper'
require 'coderetreats/state_machine'
require 'models/coderetreat_session'
require 'models/coderetreat'

describe "Managing sessions" do
  describe "#start_new_session" do
    it "adds a new CoderetreatSession to its list" do
      coderetreat = Coderetreat.create
      expect {coderetreat.start_new_session({"constraints" => "no ifs"})}.to change(coderetreat.sessions, :count).by(1)
    end

    it "initializes the session with the constraint passed in" do
      coderetreat = Coderetreat.create
      session = coderetreat.start_new_session({"constraints" => "no ifs"})
      session.constraints.should == "no ifs"
    end
  end

  describe "#in_session?" do
    it "uses the state machine to determine if it is session" do
      coderetreat = Coderetreat.new status: "not_started"
      CoderetreatLive::Coderetreats::StateMachine.stub(:in_session_status?).with(coderetreat.status) { false }
      coderetreat.should_not be_in_session

      coderetreat = Coderetreat.new status: "in_session"
      CoderetreatLive::Coderetreats::StateMachine.stub(:in_session_status?).with(coderetreat.status) { true }
      coderetreat.should be_in_session
    end
  end
end
