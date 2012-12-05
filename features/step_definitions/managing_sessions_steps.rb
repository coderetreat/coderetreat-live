When /^I start a new session$/ do |table|
  session_info = table.hashes.first
  fill_in "Constraints", with: session_info["constraints"]
  click_button "Start new session"
end

Then /^I should see the current session's constraint is "(.*?)"$/ do |constraint|
  within(".current_session.session_info") do
    page.should have_text(constraint)
  end
end

