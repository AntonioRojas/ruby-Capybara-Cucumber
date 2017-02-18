Feature: As a user I should be able to search a company from table
Scenario: Search for company on the table
  Given I am on the "https://www.w3schools.com" page
  Then I should see "HTML Table Example" title and print table:
  And I should see the following report in the "Company" column:
    | Ernst Handel |
    | Island Trading |
    | Austria |