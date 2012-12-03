require 'active_record_spec_helper'
require 'models/coderetreat'

describe "Looking up coderetreats" do
  describe ".running_today" do
    it "returns the coderetreats" do
      coderetreat1 = Coderetreat.create status: "in_session", location: "Chicago"
      coderetreat2 = Coderetreat.create status: "in_session", location: "Chicago"

      coderetreats = Coderetreat.running_today

      coderetreats.should =~ [coderetreat1, coderetreat2]
    end
  end
end
