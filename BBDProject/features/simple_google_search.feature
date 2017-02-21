Feature: As a user I should be able to perform simple google search

  Scenario: A simple google search scenario
    Given I am on the main google search
    When I fill in "q" with "Cucumber test"
    And I click search button
    And I click on the first result
    Then I should see "BDD for busy people - London, UK - March 15th 2017"