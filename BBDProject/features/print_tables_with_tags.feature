#call via cucumber --tags @qa_ready

Feature: As a user I should be able to search a company from table
  @qa_ready
  Scenario: Search for any company on the table
    Given I am on the "https://www.w3schools.com" page with HTML example
    Then I should see "HTML Table Example" title and print table
    And I should see the following customers in the "Company" column:
      | Ernst Handel |
      | Island Trading |
      | Laughing Bacchus Winecellars |


  @qa_not_ready
  Scenario: Search for all customer information on the table
    Given I am on the "https://www.w3schools.com" page with HTML example
    Then I should see "HTML Table Example" title and print table
    And I should see the following customers in the "Company" column:
      | Ernst Handel |
      | Island Trading |
      | Laughing Bacchus Winecellars |
