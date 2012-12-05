Feature: Moving a coderetreat through its statuses

  Background:
    Given I have a running coderetreat
    And I go to manage the coderetreat

  Scenario: Coderetreats start in Not Started
    Then I should see the coderetreat is in the status "Not started"

  Scenario: Going to lunch
    When I update the status to "At Lunch"
    Then I should see the coderetreat is in the status "At lunch"

  Scenario: Ending the coderetreat
    When I update the status to "Finished"
    Then I should see the coderetreat is in the status "Finished"

  Scenario: Moving through a couple statuses
    When I update the status to "At Lunch"
    Then I should see the coderetreat is in the status "At lunch"
    When I update the status to "Finished"
    Then I should see the coderetreat is in the status "Finished"
    When I update the status to "Not Started"
    Then I should see the coderetreat is in the status "Not started"
