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

