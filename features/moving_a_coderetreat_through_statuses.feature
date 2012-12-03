Feature: Moving a coderetreat through its statuses

  Background:
    Given I have a running coderetreat
    And I go to manage the coderetreat

  Scenario: Coderetreats start in Not Started
    When I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "Not Started"

  Scenario: Starting a session
    When I update the status to "In Session"
    And I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "In Session"

  Scenario: Going to lunch
    When I update the status to "At Lunch"
    And I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "At Lunch"

  Scenario: Ending the coderetreat
    When I update the status to "Finished"
    And I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "Finished"

  Scenario: Moving through a couple statuses
    When I update the status to "In Session"
    And I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "In Session"
    When I go to manage the coderetreat
    And I update the status to "At Lunch"
    And I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "At Lunch"
    When I go to manage the coderetreat
    And I update the status to "Finished"
    And I go to todays running coderetreats display page
    Then I should see the coderetreat is in the status "Finished"






