Feature: See the list of providers

  As a visitor to the website,
  I want to be able to look at the list of providers
  offered by the service

Background: Providers in database

  Given the following providers exist:
  | name        | status     | specialty   | added_to_db_date |
  | name 1      | public     | specialty 1 |   1977-05-25     |
  | name 2      | private    | specialty 1 |   1982-06-25     |
  | name 3      | private    | specialty 2 |   1979-05-25     |
  | name 4      | public     | specialty 2 |   1971-03-11     |

  And I am on the home page

Scenario: Go to the new provider page
  When I go to the new provider page
  Then I should be on the new provider page
  And I should see "add a new provider"

Scenario: Add a new provider to the list
  When I am on the new provider page
  And I fill in the following:
     | provider_name          | name 5   |
  And I select "private" from "provider_status"
  And I check "specialty_1"
  And I press "Submit"
  #Then I should be on the edit page for "name 5" TODO later
  Then I should be on the providers page
  And I should see a warning message saying: "name 5 was successfully created"

Scenario: Try to add a provider that already exists to the list and fail
  When I go to the new provider page
  And I fill in the following:
     | name          | name 4   |
     | status           | private     |
     | specialty        | specialty 1 |
  And I press "Submit"
  Then I should be on the provider home page
  And I should see a warning message
  And I should see "The movie name 4 already existed and could not be added"
  And I should see "You can try to update it"

Scenario: See all existing providers by default
  When I am on the providers home page
  Then I should see all the providers

Scenario: Restrict to providers with public status
  When I select the following status: public
  And I press "Update list"
  Then I should be on the providers home page
  And I should see "name 1"
  And I should see "name 4"
  And I should not see "name 2"
  And I should not see "name 3"

Scenario: Restrict to providers with private status
  When I select the following status: private
  And I press "Update list"
  Then I should be on the providers home page
  And I should not see "name 1"
  And I should not see "name 4"
  And I should see "name 2"
  And I should see "name 3"

Scenario: Go back to seeing all providers
  When I select the following status: all
  And I press "Update list"
  Then I should be on the providers home page
  And I should see all the providers
