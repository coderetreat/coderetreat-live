require 'active_record_spec_helper'
require 'coderetreats/state_machine'
require 'models/coderetreat'

describe "Updating a coderetreats status" do
  describe "#update_status_to" do
    it "update the attribute" do
      coderetreat = Coderetreat.create
      coderetreat.update_status_to "finished"
      coderetreat.reload.status.should == "finished"
    end

    it "returns the coderetreat" do
      coderetreat = Coderetreat.create
      coderetreat.update_status_to("finished").should == coderetreat
    end
  end
end
