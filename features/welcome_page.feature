Feature: display the home page
 
  As a new visitor
  I want to check out the home page
 
Scenario: go to the root
  When I go to the root page
  Then I should see "Welcome"
  
Scenario: go to the home page
  When I go to the welcome page
  Then I should see "Welcome"