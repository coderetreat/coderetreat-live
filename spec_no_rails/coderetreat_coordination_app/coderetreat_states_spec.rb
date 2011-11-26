require 'state_machine'
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

  context "when not_started" do
    it "can be started" do
      subject.start!
      subject.should be_started
      subject.should_not be_not_started
    end
  end

  context "when started" do
    before do
      subject.start!
    end
    it "can be not_started" do
      subject.not_started!
      subject.should be_not_started
      subject.should_not be_started
    end
  end
end
