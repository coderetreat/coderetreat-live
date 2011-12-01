Feature: Running a coderetreat

  Background:
    Given there is a coderetreat scheduled today

  Scenario: I can take it from not started to started to in introduction
    When I view the edit page for the coderetreat
    Then I should see the coderetreat is not started
    When I start the coderetreat
    Then I should see the coderetreat is started
    When I start the introduction
    Then I should see the coderetreat is in introduction

  Scenario: Starting and stopping a session
    Given the coderetreat is doing its intro
    When I view the edit page for the coderetreat
    When I start a session
    Then I should see that the coderetreat is on session 1
    When I end the session
    Then I should see that the coderetreat is on break
    When I start a session
    Then I should see that the coderetreat is on session 2
    When I end the session
    Then I should see that the coderetreat is on a break
