Feature: As a user I should be able to click Accounts tab

  Background:
  Given I am on the SFDC page

  @qa_ready
  Scenario: Any user should be able to click Accounts tab
    Given user is on Classic view
    When user clicks on Account tab
    And user selects "All Accounts" view
    Then Accounts should be listed


