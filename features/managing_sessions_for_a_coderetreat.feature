Feature: Managing sessions for a running coderetreat

  Background:
    Given I have a running coderetreat
    And I go to manage the coderetreat

  Scenario: Starting a new session
    When I start a new session
      | constraints |
      | no ifs      |
    Then I should see the coderetreat is in the status "In session"
    And I should see the current session's constraint is "no ifs"
