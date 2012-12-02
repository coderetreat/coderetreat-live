require "coderetreat_live/coderetreats"

describe "Coderetreat list" do
  describe "#empty?" do
    it "returns if passed in collection is empty" do
      CoderetreatLive::Coderetreats.for_collection([]).should be_empty
      CoderetreatLive::Coderetreats.for_collection([stub]).should_not be_empty
    end
  end

  describe "filtering the collection passed in by status" do
    describe "#not_started" do
      it "returns coderetreats that are in not_started status" do
        coderetreat1 = stub(:status => "not_started")
        coderetreat2 = stub(:status => "in_session")

        coderetreats = CoderetreatLive::Coderetreats.for_collection([coderetreat1, coderetreat2])

        coderetreats.not_started.should =~ [coderetreat1]
      end
    end
  end
end
