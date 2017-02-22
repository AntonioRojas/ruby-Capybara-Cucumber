#make sure to test your ip and update on the scenario using http://ip.jsontest.com/
Feature: As a user I should be able to calls rest_api from http://www.jsontest.com/
  Scenario: test service rest-api on http://www.jsontest.com/
    Given I do a rest-api call to "http://ip.jsontest.com/"
    Then I should get the "190.104.28.226" IP address as result

