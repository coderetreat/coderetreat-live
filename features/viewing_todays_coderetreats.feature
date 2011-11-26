Feature: Viewing the currently running coderetreats for the day

  Background:
    Given there is a coderetreat scheduled today
    And the coderetreat has started

  Scenario: Coderetreats that haven't started a session yet show they are during their intro
    Given the coderetreat hasn't start a session
    When I view today's coderetreats
    Then I should see the coderetreat is during its intro

  Scenario: Coderetreats that are in the middle of a session show it
    Given the coderetreat is on session 1
      | exercise |
      | TDD as if you meant it |
    When I view today's coderetreats
    Then I should see the coderetreat is running
    And the coderetreat is on session 1

  Scenario: Coderetreats that are on break show it
    Given the coderetreat finished session 1
    When I view today's coderetreats
    Then I should see the coderetreat is on a break after session 1


  Scenario: Coderetreats that have finished show up as finished
    Given the coderetreat has finished
    When I view today's coderetreats
    Then I should see the coderetreat has finished
