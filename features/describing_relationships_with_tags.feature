Feature: Describing relationships with tags
  In order to provide meaningful structure to the content in my wiki
  as an author,
  I want to describe the relationship between my posts when I link

Background:
  Given I am logged in as User "Alice"
  And my wiki has a Post "Underland"
  And my wiki has a Post "Queen of Hearts"
  And I am on the Post page for "Underland"

Scenario: Linking to another post with a tag
  When I add a link to "Queen of Hearts" tagged "ruling monarch" to the wikitext
  And I click the save button
  Then I should see the Post "Underland" links to Post "Queen of Hearts" as "ruling monarch"
