require 'coderetreats/state_machine'

Coderetreat.destroy_all

states = CoderetreatLive::Coderetreats::StateMachine::NOT_RUNNING_STATES + CoderetreatLive::Coderetreats::StateMachine::RUNNING_NON_SESSION_STATES
1.upto(20) do |index|
  Coderetreat.create status: states.sample, location: "City #{index}", date: DateTime.now.to_date
end

state = CoderetreatLive::Coderetreats::StateMachine::IN_SESSION_STATE
number_of_sessions = [1,2,3,4,5]

21.upto(30) do |index|
  coderetreat = Coderetreat.create status: state, location: "City #{index}", date: DateTime.now.to_date

  number_of_sessions.sample.times do |session_index|
    coderetreat.start_new_session constraints: "Super fun constraints ##{session_index}"
  end
end
