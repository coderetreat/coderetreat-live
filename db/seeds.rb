require 'coderetreats/state_machine'

Coderetreat.destroy_all

states = CoderetreatLive::Coderetreats::StateMachine::NOT_RUNNING_STATES +
  CoderetreatLive::Coderetreats::StateMachine::RUNNING_NON_SESSION_STATES
%w[
London Cairo Berlin Amsterdam San\ Francisco New\ York Tokyo Beijing Xi'an
Lijiang Dali Seattle San\ Diego Raleigh Paris Sydney Manila Seoul Kyoto Austin
].each do |city|
  Coderetreat.create(
    status: states.sample,
    location: city,
    date: DateTime.now.to_date,
  )
end

state = CoderetreatLive::Coderetreats::StateMachine::IN_SESSION_STATE
max_session_count = 5

%w[
Rome Cotonou Johannesburg Guadalahara Honolulu
Santiago Auckland Hyderabad New\ Delhi Cape\ Town
].each do |city|
  coderetreat = Coderetreat.create(
    status: state,
    location: city,
    date: DateTime.now.to_date,
  )

  session_count = (1..max_session_count).to_a.sample
  session_count.times do |session_index|
    coderetreat.start_new_session constraints: "Super fun constraints ##{session_index}"
  end
end
