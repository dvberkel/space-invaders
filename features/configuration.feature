Feature: member runs cucumber

  In order to monitor the progress of the space invaders project
  As a devnology community member
  I want to run cucumber on the features

  Scenario: test cucumber configuration
    Given a member checked out the space invaders project
    When the member runs cucumber
    Then a cucumber report should be presented