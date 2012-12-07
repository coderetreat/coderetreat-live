When /^I start a new session$/ do |table|
  session_info = table.hashes.first
  fill_in "coderetreat_session_constraints", with: session_info["constraints"]
  click_button "Start"
end

When /^I edit the current session to have constraints "(.*?)"$/ do |new_constraints|
  within(".current_session.session_info") do
    click_link "edit"
  end
  fill_in "coderetreat_session_constraints", with: new_constraints
  click_button "Update"
end

When /^I edit the previous session "(.*?)" to have constraints "(.*?)"$/ do |previous_constraints, new_constraints|
  session = CoderetreatSession.find_by_constraints previous_constraints
  within("#session_#{session.id}") do
    click_link "edit"
  end
  fill_in "coderetreat_session_constraints", with: new_constraints
  click_button "Update"
end

When /^I delete the session with constraint "(.*?)"$/ do |constraints|
  session = CoderetreatSession.find_by_constraints constraints
  within("#session_#{session.id}") do
    click_link "remove"
  end
end

Then /^I should see the current session's constraint is "(.*?)"$/ do |constraint|
  within(".current_session.session_info") do
    page.should have_text(constraint)
  end
end

Then /^I should see the previous sessions' constraints are$/ do |constraints|
  page.should have_css(".previous_sessions", count: constraints.hashes.count)
  within(".previous_sessions") do
    constraints.hashes.each do |constraint_data|
      page.should have_text(constraint_data["constraints"])
    end
  end
end
