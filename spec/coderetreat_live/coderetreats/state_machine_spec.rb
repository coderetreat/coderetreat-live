require 'coderetreats/state_machine'

describe "State machine for Coderetreats" do
  it "defaults to 'not_started'" do
    CoderetreatLive::Coderetreats::StateMachine.default_state_string.should == "not_started"
  end

  describe ".in_session_status?" do
    it "matches against the in_session_status" do
      in_session_status = CoderetreatLive::Coderetreats::StateMachine.in_session_status
      not_in_session_statuses = (CoderetreatLive::Coderetreats::StateMachine::STATES - [in_session_status])

      not_in_session_statuses.each do |status|
        CoderetreatLive::Coderetreats::StateMachine.in_session_status?(status).should be_false
      end

      CoderetreatLive::Coderetreats::StateMachine.in_session_status?(in_session_status).should be_true
    end
  end

end
