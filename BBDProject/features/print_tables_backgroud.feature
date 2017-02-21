Feature: As a user I should be able to search a company from table

  Background:
  Given I am on the main page HTML course

  @qa_ready
  Scenario: Search for any company on the table using hash
    Given I am on the "https://www.w3schools.com" page with HTML example
    And I should have the customers information in the columns:
      | Ernst Handel | Roland Mendel | Austria |
      | Island Trading | Helen Bennett | UK |
      | Laughing Bacchus Winecellars | Yoshi Tannamuri | Canada |

