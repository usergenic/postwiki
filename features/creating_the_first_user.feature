Feature: Creating the first user
  In order to get started using my new wiki,
  as the first user to the system,
  I want to create my account and login

Scenario: A wiki with no user accounts prompts to create one
  When I visit the homepage
  Then I should see the Create First User page

Scenario: Creating the first user doesn't require authentication
  Given I am on the Create First User page
  When I fill out the New User form
  And I submit the New User form
  Then my wiki should have 1 user

Scenario: Creating the first user logs me in as that user
  Given I am on the Create First User page
  When I type "Alice" in the username field
  And I fill out the New User form
  And I submit the New User form
  Then I should be logged in as User "Alice"

