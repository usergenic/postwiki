Feature: Creating a new post
  In order to communicate my ideas,
  as an author,
  I want to be able to post them to my wiki

Background:
  Given I am logged in as User "Alice"
  And my wiki has a Post "Underland"

Scenario: Visiting URL for a post that doesn't exist prompts to create it
  When I visit the Post page for "White Rabbit"
  Then I should see the Create Post form

Scenario: Creating a post
  Given I am on the Post page for "White Rabbit"
  When I write about "White Rabbit" in the wikitext field
  And I fill out the New Post form
  And I submit the New Post form
  Then I should see the Post "White Rabbit"



