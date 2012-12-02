require "coderetreat_live/coderetreats"

describe "Coderetreat list" do
  describe "#empty?" do
    it "returns if passed in collection is empty" do
      CoderetreatLive::Coderetreats.for_collection([]).should be_empty
      CoderetreatLive::Coderetreats.for_collection([stub]).should_not be_empty
    end
  end
end
