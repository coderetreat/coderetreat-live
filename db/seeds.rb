require 'coderetreats/state_machine'

Coderetreat.destroy_all

states = CoderetreatLive::Coderetreats::StateMachine::STATES
50.times do |index|
  Coderetreat.create status: states.sample, location: "City #{index}", date: DateTime.now.to_date
end
