When /^I view the edit page for the coderetreat$/ do
  visit edit_coderetreat_url(coderetreat.admin_token)
end

Then /^I should see the coderetreat is not started$/ do
  within(".status") do
    page.should have_content("Not Started")
  end
end

When /^I start the coderetreat$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the coderetreat is started$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I start the introduction$/ do
  pending # express the regexp above with the code you wish you had
end

Then /^I should see the coderetreat is in introduction$/ do
  pending # express the regexp above with the code you wish you had
end

