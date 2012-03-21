Feature: Linking to unknown post creates a placeholder
  In order to stay focused on writing and keep my flow,
  as an author,
  I want to be able to create a post simply by typing a link

Scenario: Linking to a post that doesn't exist auto-creates it
  Given I am on the Post page for "Underland"
  When I add a link to "Queen of Hearts" in the wikitext
  And I click the save button
  Then I should be on the Post page for "Underland"
  And I should see Post "Underland" links to Post "Queen of Hearts"

Scenario: Auto-created posts are auto-deleted when unmodified and untargeted
  Given I am on the Post page for "Underland"
  # unfinished...
