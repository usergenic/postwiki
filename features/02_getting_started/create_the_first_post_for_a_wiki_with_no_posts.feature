Feature: Create the first post for a wiki with no posts
  In order to get started using my new wiki,
  as an author,
  I want to be directed to create my first post

Scenario: A wiki with no posts prompts to create a first post
  Given I am logged in as User "Alice"
  When I visit the homepage
  Then I should see the Create First Post page

Scenario: Creating a first post
  Given I am logged in as User "Alice"
  And I am on the Create First Post page
  When I write about "Underland" in the wikitext field
  And I fill out the New Post form
  And I submit the New Post form
  Then I should see the Post "Underland"

Scenario: A wiki with posts no longer prompts to create a first post
  Given I am logged in as User "Alice"
  And my wiki has a Post "Underland"
  When I visit the homepage
  Then I should not see the Create First Post page
