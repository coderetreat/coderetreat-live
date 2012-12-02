Given /^I have no coderetreat running today$/ do
end

Given /^I have some coderetreats running today$/ do
  @coderetreats = [
    Coderetreat.new("not_started", "Chicago"),
    Coderetreat.new("not_started", "Seattle"),
    Coderetreat.new("in_session", "Berlin")
  ]
end

When /^I go to todays running coderetreats display page$/ do
  visit todays_running_coderetreats_url
end

Then /^I should see that no coderetreats are running$/ do
  page.should have_content("There are no coderetreats running today")
end

Then /^I should see todays coderetreats grouped by their statuses$/ do
  @coderetreats.each do |coderetreat|
    within(".#{coderetreat.status}") do
      page.should have_css(".coderetreats", text: coderetreat.location)
    end
  end
end

