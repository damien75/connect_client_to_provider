Feature: See the list of providers
  
  As a visitor to the website,
  I want to be able to look at the list of providers
  offered by the service
  
Background: Providers in database
  
  Given the following providers exist:
  | company        | status     | specialty   | added_to_db_date |
  | Company 1      | public     | specialty 1 |   1977-05-25     |
  | Company 2      | private    | specialty 1 |   1982-06-25     |
  | Company 3      | private    | specialty 2 |   1979-05-25     |
  | Company 4      | public     | specialty 2 |   1971-03-11     |
  
  And I am on the providers home page

Scenario: See all existing providers by default
  Then I should see all the providers
  
Scenario: Restrict to providers with public status
  When I select the following status: public
  And I press "Update list"
  Then I should be on the providers home page
  And I should see "Company 1"
  And I should see "Company 4"
  And I should not see "Company 2"
  And I should not see "Company 3"
  
Scenario: Restrict to providers with private status
  When I select the following status: private
  And I press "Update list"
  Then I should be on the providers home page
  And I should not see "Company 1"
  And I should not see "Company 4"
  And I should see "Company 2"
  And I should see "Company 3"
  
Scenario: Go back to seeing all providers
  When I select the following status: all
  And I press "Update list"
  Then I should be on the providers home page
  And I should see all the providers