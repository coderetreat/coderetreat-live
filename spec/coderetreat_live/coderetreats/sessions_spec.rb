require 'coderetreats/sessions'

describe "Starting a new session" do
  let(:coderetreat) { stub }
  let(:session) { stub }
  describe ".for_coderetreat" do
    before do
      CoderetreatLive::Coderetreats.stub(:for_admin_token) { coderetreat }
      coderetreat.stub(:session_by_id) { session }
    end
    it "returns the session as first value" do
      returned_session, _ = CoderetreatLive::Coderetreats::Sessions.for_coderetreat("token", "5")
      returned_session.should == session
    end
    it "returns the coderetreat as second value" do
      _, returned_coderetreat = CoderetreatLive::Coderetreats::Sessions.for_coderetreat("token", "5")
      returned_coderetreat.should == coderetreat
    end
  end

  describe ".start_new_session_for" do
    before do
      CoderetreatLive::Coderetreats.stub(:update_status) { coderetreat }
      coderetreat.stub(:start_new_session) { session }
    end
    it "updates the status of the coderetreat to 'in_session'" do
      CoderetreatLive::Coderetreats.should_receive(:update_status).with("token", "in_session") { coderetreat }

      CoderetreatLive::Coderetreats::Sessions.start_new_session_for("token", {"constraints" => "irrelevant"})
    end

    it "tells the coderetreat to start a new session" do
      coderetreat.should_receive(:start_new_session).with({"constraints" => "irrelevant"})
      CoderetreatLive::Coderetreats::Sessions.start_new_session_for("token", {"constraints" => "irrelevant"})
    end

    it "returns the session that was started" do
      CoderetreatLive::Coderetreats::Sessions.start_new_session_for("token", stub).should == session
    end
  end

  describe ".remove_session_from" do
    it "tells coderetreat to remove the session given by the id" do
      CoderetreatLive::Coderetreats.stub(:for_admin_token).with("token") { coderetreat }
      coderetreat.should_receive(:remove_session).with("5")


      CoderetreatLive::Coderetreats::Sessions.remove_session_from("token", "5")
    end
  end
end
