require 'spec_helper'

describe Coderetreat do
  context "scopes" do
    describe ".for_day" do
      it "returns the coderetreats for today" do
        coderetreat = Coderetreat.create! scheduled_for: Date.today
        Coderetreat.for_today.map(&:id).should =~ [coderetreat.id]
      end

      it "does not return the coderetreats not for today" do
        Coderetreat.create! scheduled_for: (Date.today - 1.day)
        Coderetreat.create! scheduled_for: (Date.today + 1.day)
        Coderetreat.for_today.should be_empty
      end
    end
  end
end
