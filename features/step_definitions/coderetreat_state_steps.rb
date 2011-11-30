Given /^there is a coderetreat scheduled today$/ do
  event = Coderetreat.create! scheduled_for: Date.today, location: "Location"
  coderetreats << event
end

Given /^the coderetreat has started$/ do
  coderetreat.start!
end

Given /^the coderetreat has not started$/ do
  coderetreat.not_started!
end

Given /^the coderetreat is doing its intro$/ do
  coderetreat.do_introduction!
end

Given /^the coderetreat is on session (\d+)$/ do |session_number|
  coderetreat.start_session!
end

Given /^the coderetreat has finished the session$/ do
  coderetreat.finish_session!
end


