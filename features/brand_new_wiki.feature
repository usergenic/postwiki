Feature: Brand New Wiki
  In order to derive value from my new wiki as soon as possible,
  as an admin,
  I want to be able get immediate access and start authoring posts

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

Scenario: A wiki with no posts prompts to create a first post
  Given I am logged in as User "Alice"
  When I visit the homepage
  Then I should see the Create First Post page

Scenario: Creating the first post
  Given I am logged in as User "Alice"
  And I am on the Create First Post page
  When I write about "Underland" in the wikitext field
  And I fill out the New Post form
  And I submit the New Post form
  Then I should see the Post "Underland"
