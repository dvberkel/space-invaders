Feature: shoot an alien

  In order to increase the space invaders experience
  As a devnology communit member
  I want to operate a gun to shoot an alien

  Scenario: shoot an alien
    Given an alien at (0,15)
    And a gun at (0,0)
    When a bullet is fired
    Then the alien should die within 3 ticks