Given /^there is a coderetreat scheduled today$/ do
  event = Coderetreat.new
  event.scheduled_for = Date.today
  coderetreats << event
end

Given /^the coderetreat has started$/ do
  coderetreats.first.start!
end

Given /^the coderetreat has not started$/ do
  coderetreats.first.not_started!
end


