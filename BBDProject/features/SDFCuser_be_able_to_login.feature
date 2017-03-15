Feature: As a user I should be able to login to SFDC

  Background:
  Given I am on the login page SFDC page

  @qa_ready
  Scenario: Any user with right permission should be able to login into SDFC
    Given user "xxxxx" and password "xxxxx"
    When I press log in button
    Then I should be able to enter to SDFC main page
    And I should be able to see account information "Antonio Rojas" on SDFC page


