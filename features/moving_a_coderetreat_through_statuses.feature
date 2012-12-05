Feature: Moving a coderetreat through its statuses

  Background:
    Given I have a running coderetreat
    And I go to manage the coderetreat

  Scenario: Coderetreats start in Not Started
    Then I should see the coderetreat is in the status "Not Started"

    @wip
  Scenario: Starting a session
    When I update the status to "In Session"
    Then I should see the coderetreat is in the status "In Session"

  Scenario: Going to lunch
    When I update the status to "At Lunch"
    Then I should see the coderetreat is in the status "At Lunch"

    @wip
  Scenario: Ending the coderetreat
    When I update the status to "Finished"
    Then I should see the coderetreat is in the status "Finished"

    @wip
  Scenario: Moving through a couple statuses
    When I update the status to "In Session"
    Then I should see the coderetreat is in the status "In Session"
    When I update the status to "At Lunch"
    Then I should see the coderetreat is in the status "At Lunch"
    When I update the status to "Finished"
    Then I should see the coderetreat is in the status "Finished"
