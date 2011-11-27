Feature: Starting a coderetreat

  Background:
    Given there is a coderetreat scheduled today

  Scenario: I can take it from not started to started to in introduction
    When I view the edit page for the coderetreat
    Then I should see the coderetreat is not started
    When I start the coderetreat
    Then I should see the coderetreat is started
    When I start the introduction
    Then I should see the coderetreat is in introduction
