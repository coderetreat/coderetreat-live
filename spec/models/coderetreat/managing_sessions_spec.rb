require 'active_record_spec_helper'
require 'coderetreats/state_machine'
require 'models/coderetreat_session'
require 'models/coderetreat'

describe "Managing sessions" do
  describe "#start_new_session" do
    it "adds a new CoderetreatSession to its list" do
      coderetreat = Coderetreat.create
      expect {coderetreat.start_new_session({"constraints" => "no ifs"})}.to change(coderetreat.sessions, :count).by(1)
    end

    it "initializes the session with the constraint passed in" do
      coderetreat = Coderetreat.create
      session = coderetreat.start_new_session({"constraints" => "no ifs"})
      session.constraints.should == "no ifs"
    end
  end
end
