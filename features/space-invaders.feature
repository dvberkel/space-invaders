Feature: member plays space invaders

  In order to attend the devnology 2012 Code Fest
  As a devnology community member
  I want to play a game of space invaders

  Scenario: create a space invaders game
    Given a new space invaders game
    When a score is asked
    Then the player scored 0