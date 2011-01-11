Feature: Inserting Coins
  In order to avoid starvation
  As a hungry traveller 
  I want to buy some food

  Scenario: Insert coin
    Given I have inserted a 1 euro coin into the candy machine
    And I have inserted a 2 euro coin into the candy machine
    When I take a look at the display
    Then the display should read '3.00'
    
  Scenario: Insert eurocent coins
    Given I have inserted a 50 eurocent coin into the candy machine
    And I have inserted a 20 eurocent coin into the candy machine
    When I take a look at the display
    Then the display should read '0.70'

  Scenario: Insert invalid coin
    Given I have inserted a 1 eurocent coin into the candy machine
    When I take a look at the display
    Then the display should read '0.00'
    And I should find 1 eurocent in the change drawer
    
  Scenario: Insert free-beer-coin
    Given I have inserted an eurosonic coin into the candy machine
    When I take a look at the display
    Then the display should read '0.00'
    And I should find 1 eurosonic in the change drawer

  Scenario: Insert random pocket change
    Given I have inserted a 50 eurocent coin into the candy machine
    And I have inserted a 1 eurocent coin into the candy machine    
    And I have inserted a 2 eurocent coin into the candy machine    
    When I take a look at the display
    Then the display should read '0.50'
    And I should find 1 eurocent in the change drawer    
    And I should find 2 eurocent in the change drawer
    
  Scenario: Insert random pocket change
    Given I have inserted a 1 euro coin into the candy machine
    And I have inserted a 20 eurocent coin into the candy machine    
    And I have inserted a 10 eurocent coin into the candy machine    
    And I have inserted a 5 eurocent coin into the candy machine    
    When I take a look at the display
    Then the display should read '1.35'
  
  Scenario: Abort purchase
    Given I have inserted a 1 euro coin into the candy machine
    And I have inserted a 20 eurocent coin into the candy machine    
    And I have inserted a 10 eurocent coin into the candy machine    
    And I have inserted a 5 eurocent coin into the candy machine    
    When I press the abort button
    And I take a look at the display
    Then the display should read '0.00'
    And I should find 1 euro, 20 eurocent, 10 eurocent, 5 eurocent in the change drawer    
  
