require 'active_record_spec_helper'
require 'coderetreats/state_machine'
require 'models/coderetreat'

describe "Updating a coderetreats status" do
  it "update the attribute" do
    coderetreat = Coderetreat.create
    coderetreat.update_status_to "finished"
    coderetreat.reload.status.should == "finished"
  end
end
