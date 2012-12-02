Feature: Viewing coderetreats running today

  Scenario: No coderetreats running today
    Given I have no coderetreat running today
    When I go to todays running coderetreats display page
    Then I should see that no coderetreats are running

  Scenario: Some coderetreats running today
    Given I have some coderetreats running today
    When I go to todays running coderetreats display page
    Then I should see todays coderetreats grouped by their statuses
