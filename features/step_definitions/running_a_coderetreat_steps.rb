def check_coderetreat_status(text)
  within(".status") do
    page.should have_content(text)
  end
end

When /^I view the edit page for the coderetreat$/ do
  visit edit_coderetreat_url(coderetreat.admin_token)
end

Then /^I should see the coderetreat is not started$/ do
  check_coderetreat_status "Not Started"
end

When /^I start the coderetreat$/ do
  click_link "Start"
end

Then /^I should see the coderetreat is started$/ do
  check_coderetreat_status "Started"
end

When /^I start the introduction$/ do
  click_link "Do Introduction"
end

Then /^I should see the coderetreat is in introduction$/ do
  check_coderetreat_status "In Introduction"
end

When /^I start a session$/ do
  click_link "Start Session"
end

Then /^I should see that the coderetreat is on session (\d+)$/ do |arg1|
  pending # express the regexp above with the code you wish you had
end

When /^I end the session$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see that the coderetreat is on break$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see that the coderetreat is on a break$/ do
  pending # express the regexp above with the code you wish you had
end

