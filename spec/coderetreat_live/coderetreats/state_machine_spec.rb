require 'coderetreats/state_machine'

describe "State machine for Coderetreats" do
  it "defaults to 'not_started'" do
    CoderetreatLive::Coderetreats::StateMachine.default_state_string.should == "not_started"
  end
end

