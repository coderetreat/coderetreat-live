Feature: Managing sessions for a running coderetreat

  Background:
    Given I have a running coderetreat
    And I go to manage the coderetreat
    And I start a new session
      | constraints |
      | no ifs      |

  Scenario: Starting a new session
    Then I should see the coderetreat is in the status "In session"
    And I should see the current session's constraint is "no ifs"

  Scenario: Deleting the current session
    When I start a new session
      | constraints |
      | no talking  |
    Then I should see the current session's constraint is "no talking"
    When I delete the current session
    And I should see the current session's constraint is "no ifs"

  Scenario: Deleting a previous session
    When I start a new session
      | constraints |
      | no looping  |
    And I start a new session
      | constraints |
      | no talking  |
    Then I should see the current session's constraint is "no talking"
    When I delete the session with constraint "no looping"
    Then I should see the previous sessions' constraints are
      | constraints |
      | no ifs      |

  Scenario: Editing the current session
    When I edit the current session to have constraints "no looping"
    Then I should see the current session's constraint is "no looping"

  Scenario: Editing a previous Session
    Given I start a new session
      | constraints |
      | don't talk  |
    And I edit the previous session "no ifs" to have constraints "looping allowed"
    Then I should see the previous sessions' constraints are
      | constraints     |
      | looping allowed |

