require 'coderetreat_states'

class DummyCoderetreat
  attr_accessor :state
  include CoderetreatCoordinationApp::CoderetreatStates
end

describe "The states a coderetreat can be in" do
  subject { DummyCoderetreat.new }

  it "starts off as not_started" do
    subject.should be_not_started
  end
end
