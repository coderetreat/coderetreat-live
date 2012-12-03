require 'active_record_spec_helper'
require 'coderetreats/state_machine'
require 'models/coderetreat'

describe "Default values for Coderetreats" do
  example "status defaults to default from state machine" do
    coderetreat = Coderetreat.create
    coderetreat.status.should == CoderetreatLive::Coderetreats::StateMachine.default_state_string
  end
end
