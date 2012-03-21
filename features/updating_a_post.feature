Feature: Updating a post
  In order to keep my wiki accurate and up-to-date,
  as an author,
  I want to make changes to existing posts

Background:
  Given I am logged in as User "Alice"
  And my wiki has a Post "Underland"

Scenario: To start editing, click the edit button when viewing a post
  Given I am on the Post page for "Underland"
  When I click the edit link
  Then I should see the Edit Post form

Scenario: To abort editing and return to view mode, click cancel
  Given I am on the Edit Post page for "Underland"
  When I click the cancel link
  Then I should be on the Post page for "Underland"

Scenario: To save changes, click the save button when editing a post
  Given I am on the Edit Post page for "Underland"
  When I add some content about "Down the Rabbit Hole" to the wikitext
  And I click on the save button
  Then I should be on the Post page for "Underland"
  And I should see some content about "Down the Rabbit Hole"


