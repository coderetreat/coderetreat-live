require 'presenters/coderetreats'

describe "Presenting a list of coderetreats" do
  describe "#not_started" do
    subject { CoderetreatCoordinationApp::Presenters::Coderetreats.new(coderetreats).not_started }
    let(:not_started) { stub(not_started?: true) }
    let(:started) { stub(not_started?: false) }
    let(:coderetreats) { [not_started, started] }
    it "only includes the coderetreats that are not_started" do
      subject.should =~ [not_started]
    end
  end
end
