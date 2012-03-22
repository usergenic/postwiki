Feature: Linking to other posts
  In order to read posts which are referenced by other posts,
  as a reader,
  I want to click on a link to visit another post

Background:
  Given I am logged in as User "Alice"
  And my wiki has a Post "White Rabbit"
  And my wiki has a Post "Underland"

Scenario: Adding a link in the wikitext
  Given I am on the Post page for "White Rabbit"
  When I add a link to "Underland" in the wikitext
  And I click the save button
  Then I should see Post "White Rabbit" links to Post "Underland"

Scenario: Removing a link from wikitext
  Given the Post "White Rabbit" links to Post "Underland"
  And I am on the Post page for "White Rabbit"
  When I remove the link to "Underland" from the wikitext
  And I click the save button
  Then I should see Post "White Rabbit" does not link to Post "Underland"
