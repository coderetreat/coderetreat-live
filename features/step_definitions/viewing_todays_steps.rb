When /^I view today's coderetreats$/ do
  visit todays_coderetreats_path
end

Then /^I should see the coderetreat hasn't started yet$/ do
  coderetreat = coderetreats.first
  within ".coderetreats.not_started" do
    page.should have_css("coderetreat_#{coderetreat.id}")
  end
end
