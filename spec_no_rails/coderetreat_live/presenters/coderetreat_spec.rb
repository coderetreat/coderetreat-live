require 'presenters/coderetreats'

describe "Presenting a list of coderetreats" do
  describe "#not_started" do
    subject { CoderetreatLive::Presenters::Coderetreats.new(coderetreats).not_started }
    let(:not_started) { stub(not_started?: true) }
    let(:started) { stub(not_started?: false) }
    let(:coderetreats) { [not_started, started] }
    it "only includes the coderetreats that are not_started" do
      subject.should =~ [not_started]
    end
  end

  describe "#just_started" do
    subject { CoderetreatLive::Presenters::Coderetreats.new(coderetreats).just_started }
    let(:just_started) { stub(just_started?: true) }
    let(:not_just_started) { stub(just_started?: false) }
    let(:coderetreats) { [just_started, not_just_started] }
    it "only includes the coderetreats that have just started" do
      subject.should =~ [just_started]
    end
  end

  describe "#in_introduction" do
    subject { CoderetreatLive::Presenters::Coderetreats.new(coderetreats).in_introduction }
    let(:in_introduction) { stub(in_introduction?: true) }
    let(:not_in_introduction) { stub(in_introduction?: false) }
    let(:coderetreats) { [in_introduction, not_in_introduction] }
    it "only includes the coderetreats that are in_introduction" do
      subject.should =~ [in_introduction]
    end
  end

  describe "#in_session" do
    subject { CoderetreatLive::Presenters::Coderetreats.new(coderetreats).in_session }
    let(:in_session) { stub(in_session?: true) }
    let(:not_in_session) { stub(in_session?: false) }
    let(:coderetreats) { [in_session, not_in_session] }
    it "only includes the coderetreats that are in_session" do
      subject.should =~ [in_session]
    end
  end

  describe "#on_break" do
    subject { CoderetreatLive::Presenters::Coderetreats.new(coderetreats).on_break }
    let(:on_break) { stub(on_break?: true) }
    let(:not_on_break) { stub(on_break?: false) }
    let(:coderetreats) { [on_break, not_on_break] }
    it "only includes the coderetreats that are on_break" do
      subject.should =~ [on_break]
    end
  end
end
