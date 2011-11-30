Given /^there is a coderetreat scheduled today$/ do
  event = Coderetreat.create! scheduled_for: Date.today, location: "Location"
  coderetreats << event
end

Given /^the coderetreat has started$/ do
  coderetreats.first.start!
end

Given /^the coderetreat has not started$/ do
  coderetreats.first.not_started!
end

Given /^the coderetreat is doing its intro$/ do
  coderetreats.first.do_introduction!
end

Given /^the coderetreat is on session (\d+)$/ do |session_number, table|
  coderetreat.start_session!
end

