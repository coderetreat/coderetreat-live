When /^I start a new session$/ do |table|
  session_info = table.hashes.first
  fill_in "session[constraints]", with: session_info["constraints"]
  click_button "Start new session"
end

Then /^I should see the current session's constraint is "(.*?)"$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

