require 'state_machine'
require 'coderetreat_states'

class DummyCoderetreat
  attr_accessor :state
  include CoderetreatLive::CoderetreatStates
end

describe "getting state information" do
  let(:coderetreat) { DummyCoderetreat.new }
  context "not started" do
    subject { coderetreat.state_information }
    its(:current_state) { should == :not_started }
    its(:current_state_display) { should == "not started" }
    its(:next_state) { should == :start }
    its(:next_state_display) { should == "Start" }
  end
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

    it "can go to introduction" do
      subject.do_introduction!
      subject.should be_in_introduction
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

    it "shows up as just_started" do
      subject.should be_just_started
    end

    it "can be put into in_introduction" do
      subject.do_introduction!
      subject.should be_in_introduction
    end

    it "can start a session" do
      subject.start_session!
      subject.should be_in_session
    end
  end

  context "when do_introduction" do
    before do
      subject.start!
      subject.do_introduction!
    end
    it "is no longer just_started" do
      subject.should be_in_introduction
      subject.should_not be_just_started
    end

    it "can start a session" do
      subject.start_session!
      subject.should be_in_session
    end
  end
end

