Feature: Viewing the currently running coderetreats for the day

  Background:
    Given there is a coderetreat scheduled today
    And the coderetreat has started

  Scenario: Coderetreats that haven't started at all show up as upcoming
    Given the coderetreat has not started
    When I view today's coderetreats
    Then I should see the coderetreat hasn't started yet

  Scenario: Coderetreats that have started but nothing else show up as started
    When I view today's coderetreats
    Then I should see the coderetreat just started

  Scenario: Coderetreats can be shown as doing their intro
    Given the coderetreat is doing its intro
    When I view today's coderetreats
    Then I should see the coderetreat is during its intro

  Scenario: Coderetreats that are in the middle of a session show it
    Given the coderetreat is on session 1
    When I view today's coderetreats
    Then I should see the coderetreat is on session 1

  Scenario: Coderetreats that are on break show it
    Given the coderetreat is on session 1
    And the coderetreat has finished the session
    When I view today's coderetreats
    Then I should see the coderetreat is on a break after session 1

  Scenario: Coderetreats that are doing their closing circle show it
    Given the coderetreat is doing its closing circle
    When I view today's coderetreats
    Then I should see the coderetreat is on its closing circle

  Scenario: Coderetreats that have finished show up as finished
    Given the coderetreat has finished
    When I view today's coderetreats
    Then I should see the coderetreat has finished
