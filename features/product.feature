Feature: Getting products out of the machine
  In order to avoid starvation
  As a hungry traveller 
  I want to buy some food

  Scenario: Pressing one numbered key
    When I press 1
    And I take a look at the display
    Then the display should read '1'

  Scenario: Pressing two numbered keys
    Given there is nothing with the number 12
    When I press 1
    And I press 2
    And I take a look at the display
    Then the display should read '404'

  Scenario: Get chunky bacon
    Given I have deposited 2.00 euro
    And there is at least one chunky bacon priced 1.50 euro with number 37 in the machine
    When I press 3
    And I press 7
    Then there should be a chunky bacon in the drawer
    And there should be 50 eurocent in the change drawer
