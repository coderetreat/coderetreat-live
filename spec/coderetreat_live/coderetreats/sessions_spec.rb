require 'coderetreats/sessions'

describe "Starting a new session" do
  it "updates the status of the coderetreat to 'in_session'" do
    coderetreat = stub
    CoderetreatLive::Coderetreats.should_receive(:update_status).with("token", "in_session") { coderetreat }

    CoderetreatLive::Coderetreats::Sessions.start_new_session_for("token", {"constraints" => "irrelevant"})
  end
end
