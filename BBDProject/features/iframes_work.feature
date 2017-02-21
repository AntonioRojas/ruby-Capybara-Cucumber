Feature: As a user I should be able to lick on iframe links
  Scenario: Click on iframe links
    Given I am on the "file:///C:/rubyTest/BBDProject/features" page with iframe example
    Then I should see "Main Frame" title in the "center" iframe
    And I should be able to click on "left" iframe the "google" link
    And go to "right" iframe and check title "Bottom Frame"
