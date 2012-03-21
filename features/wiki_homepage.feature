Feature: Wiki Homepage
  In order to give context to users coming to the front door
  As an admin
  I want to assign one of my posts to be my wiki's homepage

Scenario: Creating the first post sets it as the homepage
  Given my wiki has no posts
  And I am logged in as User "Alice"
  And I am on the Create First Post page
  When I submit the New Post form with text about "Wonderland"
  And I visit the homepage
  Then I should see the Post "Wonderland"

Scenario: Visiting the homepage displays the assigned post
  Given my wiki has a Post "Wonderland"
  And my wiki's homepage is the Post "Wonderland"
  When I visit the homepage
  Then I should see the Post "Wonderland"

Scenario: Changing the homepage
  Given my wiki has a Post "Walrus"
  And my wiki has a Post "Carpenter"
  And my wiki's homepage is the Post "Walrus"
  And I am on the Wiki Settings page
  When I submit the Update Settings form with homepage "Carpenter"
  And I visit the homepage
  Then I should see the Post "Carpenter"
