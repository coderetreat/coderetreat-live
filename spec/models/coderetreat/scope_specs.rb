require 'active_record_spec_helper'
require 'models/coderetreat'

describe "Looking up coderetreats" do
  describe ".running_today" do
    it "returns the coderetreats running today" do
      coderetreat1 = Coderetreat.create status: "in_session", location: "Chicago", date: DateTime.now.to_date
      coderetreat2 = Coderetreat.create status: "in_session", location: "Chicago", date: 1.day.from_now

      coderetreats = Coderetreat.running_today

      coderetreats.all.should =~ [coderetreat1]
    end
  end
end
