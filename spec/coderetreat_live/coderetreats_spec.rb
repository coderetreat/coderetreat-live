require "coderetreat_live/coderetreats"

describe "Coderetreat list" do
  let(:collection) { [] }
  let(:coderetreats) { CoderetreatLive::Coderetreats.for_collection(collection) }

  describe "#empty?" do
    it "returns if passed in collection is empty" do
      coderetreats.should be_empty
      collection << stub
      coderetreats.should_not be_empty
    end
  end

  describe "filtering the collection passed in by status" do
    let(:coderetreat1) { stub(:status => "") }
    let(:coderetreat2) { stub(:status => "") }
    before do
      collection << coderetreat1 << coderetreat2
    end
    describe "#not_started" do
      it "returns coderetreats that are in not_started status" do
        coderetreat1.stub(:status => "not_started")
        coderetreat2.stub(:status => "in_session")
        filtered = []
        coderetreats.not_started {|cr| filtered << cr }
        filtered.should =~ [coderetreat1]
      end
    end
    describe "#in_session" do
      it "returns coderetreats that are in in_session status" do
        coderetreat1.stub(:status => "not_started")
        coderetreat2.stub(:status => "in_session")
        filtered = []
        coderetreats.in_session {|cr| filtered << cr }
        filtered.should =~ [coderetreat2]
      end
    end
  end

  describe "Looking up different lists of coderetreats" do
    describe ".running_today" do
      it "returns the list from the Coderetreat.running_today scope" do
        scope_provider = stub
        stub_const("Coderetreat", scope_provider)

        scope_provider.stub(:running_today) { collection }

        running_today = CoderetreatLive::Coderetreats.running_today
        running_today.coderetreats.should be(collection)
      end
    end
  end
end
