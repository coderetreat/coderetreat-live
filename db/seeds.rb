Coderetreat.destroy_all

[
  "Chicago, IL",
  "Pittsburgh, PA",
  "Sydney, Australia",
  "Honolulu, HI",
  "Krakow, Poland"
].each do |location|
  Coderetreat.create!(scheduled_for: Date.today, location: location)
end

[
  "Tokyo, Japan"
].each do |location|
  c = Coderetreat.create!(scheduled_for: Date.today, location: location)
  c.start!
  c.do_introduction!
end
