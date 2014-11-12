require 'active_record_spec_helper'
require 'coderetreats/state_machine'
require 'models/coderetreat_session'
require 'models/coderetreat'

describe "Managing sessions" do
  describe "#session_by_id" do
    it "returns the session for that id" do
      coderetreat = Coderetreat.create
      session = coderetreat.start_new_session({"constraints" => "not important"})

      returned_session = coderetreat.session_by_id session.id

      returned_session.should == session
    end
  end

  describe ".update_session_info" do
    it "updates the session info for the given session" do
      coderetreat = Coderetreat.create
      session = coderetreat.start_new_session({"constraints" => "not important"})

      coderetreat.update_session_info(session.id, {"constraints" => "yes important"})

      coderetreat.session_by_id(session.id).constraints.should == "yes important"
    end
  end

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

    it "creates a default constraint if none is provided" do
      coderetreat = Coderetreat.create
      session = coderetreat.start_new_session({"constraints" => nil})
      session.constraints.should == "Session 1"
      session = coderetreat.start_new_session({"constraints" => ""})
      session.constraints.should == "Session 2"
    end
  end

  describe "#in_session?" do
    it "uses the state machine to determine if it is session" do
      coderetreat = Coderetreat.new status: "not_started"
      coderetreat.sessions << CoderetreatSession.new
      CoderetreatLive::Coderetreats::StateMachine.stub(:in_session_status?).with(coderetreat.status) { false }
      coderetreat.should_not be_in_session

      coderetreat = Coderetreat.new status: "in_session"
      coderetreat.sessions << CoderetreatSession.new
      CoderetreatLive::Coderetreats::StateMachine.stub(:in_session_status?).with(coderetreat.status) { true }
      coderetreat.should be_in_session
    end

    it "needs to have an actual session" do
      coderetreat = Coderetreat.new status: "in_session"
      CoderetreatLive::Coderetreats::StateMachine.stub(:in_session_status?).with(coderetreat.status) { true }

      coderetreat.should_not be_in_session
    end
  end

  describe "#current_session_constraints" do
    it "returns the constraints for the most recently started session" do
      coderetreat = Coderetreat.create
      coderetreat.start_new_session "constraints" => "no loops"
      coderetreat.start_new_session "constraints" => "no ifs"

      coderetreat.current_session_constraints.should == "no ifs"
    end
  end

  describe "#previous_sessions" do
    it "does not include the current session in the list" do
      coderetreat = Coderetreat.create
      expected = []

      expected << coderetreat.start_new_session("constraints" => "no loops")
      expected << coderetreat.start_new_session("constraints" => "no ifs")
      coderetreat.start_new_session "constraints" => "no primitives"

      coderetreat.previous_sessions.should =~ expected
    end
  end

  describe "#remove_session" do
    it "removes the session from its list" do
      coderetreat = Coderetreat.create
      expected = []

      expected << coderetreat.start_new_session("constraints" => "no loops")
      remove_this = coderetreat.start_new_session "constraints" => "no primitives"

      coderetreat.remove_session remove_this.id

      coderetreat.sessions.should =~ expected
    end
  end

end
