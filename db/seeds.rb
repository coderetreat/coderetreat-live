Coderetreat.destroy_all

5.times {|index| Coderetreat.create!(scheduled_for: Date.today, city: "Unstarted City #{index}", country: "Country #{index}") }

