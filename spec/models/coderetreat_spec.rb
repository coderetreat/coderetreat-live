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

  context "creating one" do
    it "generates an admin token" do
      coderetreat = Coderetreat.create! scheduled_for: Date.today
      coderetreat.admin_token.should_not be_empty
    end
  end

  describe ".for_admin" do
    it "returns for the admin token" do
      coderetreat = Coderetreat.create! scheduled_for: Date.today
      Coderetreat.for_admin(coderetreat.admin_token).should == coderetreat
    end
    it "raises a ActiveRecord::RecordNotFound if invalid" do
      expect {
      Coderetreat.for_admin("not there")
      }.should raise_error(ActiveRecord::RecordNotFound)
    end
  end
end
