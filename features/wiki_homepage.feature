Feature: Wiki Homepage
  In order to give context to users coming to the front door,
  as an admin,
  I want to assign one of my posts to be my wiki's homepage

Background:
  Given I am logged in as User "Alice"

Scenario: Creating the first post sets it as the homepage
  Given I am on the Create First Post page
  When I write about "Underland" in the wikitext field
  And I fill out the New Post form
  And I submit the New Post form
  And I visit the homepage
  Then I should see the Post "Underland"

Scenario: Visiting the homepage displays the assigned post
  Given my wiki has a Post "Underland"
  And my wiki's homepage is the Post "Underland"
  When I visit the homepage
  Then I should see the Post "Underland"

Scenario: Changing the homepage
  Given my wiki has a Post "Walrus"
  And my wiki has a Post "Carpenter"
  And my wiki's homepage is the Post "Walrus"
  And I am on the Wiki Settings page
  When I type "Carpenter" in the homepage field
  And I submit the Update Settings form
  And I visit the homepage
  Then I should see the Post "Carpenter"
