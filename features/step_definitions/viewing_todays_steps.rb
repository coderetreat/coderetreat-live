When /^I view today's coderetreats$/ do
  visit todays_coderetreats_path
end

Then /^I should see the coderetreat hasn't started yet$/ do
  within ".coderetreats.not_started" do
    page.should have_css(coderetreat_selector)
  end
end

Then /^I should see the coderetreat is during its intro$/ do
  within ".coderetreats.doing_introduction" do
    page.should have_css(coderetreat_selector)
  end
end

Then /^I should see the coderetreat just started$/ do
  within ".coderetreats.just_started" do
    page.should have_css(coderetreat_selector)
  end
end

Then /^I should see the coderetreat is on session (\d+)$/ do |session_number|
  within ".coderetreats.in_session" do
    page.should have_css(coderetreat_selector)
    within coderetreat_selector do
      page.should have_content("Session #{session_number}")
    end
  end
end


