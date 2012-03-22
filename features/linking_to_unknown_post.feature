Feature: Linking to unknown post creates a placeholder
  In order to stay focused on writing and keep my flow,
  as an author,
  I want to be able to create a post simply by typing a link

Background:
  Given I am logged in as User "Alice"

Scenario: Linking to a post that doesn't exist auto-creates it
  Given I am on the Post page for "Underland"
  When I add a link to "Queen of Hearts" in the wikitext
  And I click the save button
  Then I should see the Post "Underland" links to the Post "Queen of Hearts"

Scenario: Auto-created posts are auto-deleted when unmodified and untargeted
  Given my wiki has a placeholder Post "Queen of Hearts"
  And the Post "Underland" links to the Post "Queen of Hearts"
  And I am on the Post page for "Underland"
  When I remove the link to "Queen of Hearts" from the wikitext
  And I click the save button
  And I visit the Post page for "Queen of Hearts"
  Then I should see the Create Post form

Scenario: Auto-created posts are not placeholders after user modifies them
  Given my wiki has a placeholder Post "Queen of Hearts"
  And the Post "Underland" links to the Post "Queen of Hearts"
  And I am on the Post page for "Queen of Hearts"
  When I write about "Queen of Hearts" in the wikitext
  And I click the save button
  And I visit the Post page for "Underland"
  And I remove the link to "Queen of Hearts" from the wikitext
  And I click the save button
  And I visit the Post page for "Queen of Hearts"
  Then I should see the Post "Queen of Hearts"
