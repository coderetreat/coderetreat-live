def create_coderetreat_record(params = {})
  ::Coderetreat.create params
end

def new_coderetreat(status, location, date = DateTime.now.to_date)
  create_coderetreat_record status: status, location:location, date: date
end

Given /^I have no coderetreat running today$/ do
  ::Coderetreat.destroy_all
end

Given /^I have some coderetreats running today$/ do
  @coderetreats = []
  10.times do |index|
    @coderetreats << new_coderetreat(CoderetreatLive::Coderetreats::StateMachine::STATES.sample, "City #{index}")
  end
end

Given /^I have a running coderetreat$/ do
  @coderetreat = create_coderetreat_record location: "Chicago", date: DateTime.now.to_date
end

When /^I go to manage the coderetreat$/ do
  visit manage_coderetreat_url(id: @coderetreat.admin_token)
end
When /^I update the status to "(.*?)"$/ do |status|
  click_link status
end

When /^I go to todays running coderetreats display page$/ do
  visit running_today_coderetreats_url
end

Then /^I should see that no coderetreats are running$/ do
  page.should have_content("There are no coderetreats running today")
end

Then /^I should see todays coderetreats grouped by their statuses$/ do
  @coderetreats.each do |coderetreat|
    within(".#{coderetreat.status}") do
      page.should have_css(".coderetreat", text: coderetreat.location)
    end
  end
end

Then /^I should see the coderetreat is in the status "(.*?)"$/ do |status|
  within(".#{status.gsub(" ","").underscore}") do
    page.should have_css(".coderetreat", text: @coderetreat.location)
  end
end

