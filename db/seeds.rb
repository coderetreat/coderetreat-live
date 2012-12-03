Coderetreat.destroy_all

states = [:in_session, :not_started]
10.times do |index|
  Coderetreat.create status: states.sample, location: "City #{index}", date: DateTime.now.to_date
end
