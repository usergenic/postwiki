Feature: Link to Post
  In order to read posts which are referenced by other posts,
  as a reader,
  I want to click on a link to visit another post

Background:
  Given I am logged in as User "Alice"
  And my wiki has a Post "White Rabbit"
  And my wiki has a Post "Wonderland"

Scenario: Submitting wikitext containing a new link creates a link
  Given I am on the Post page for "White Rabbit"
  When I add a link to "Wonderland" to the wikitext input
  And I submit the Edit Post form
  Then I should see "White Rabbit" links to "Wonderland"

Scenario: Submitting wikitext without a link removed, destroys a link
  Given the Post "White Rabbit" links to Post "Wonderland"
  And I am on the Post page for "White Rabbit"
  When I delete the link to "Wonderland" from the wikitext input
  And I submit the Edit Post form
  And I should not see "White Rabbit" links to "Wonderland"

