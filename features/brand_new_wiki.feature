Feature: Brand New Wiki
  In order to start benefitting from my new wiki
  As an author
  I want to be able to start using my wiki immediately

Scenario: A wiki with no user accounts prompts to create one
  Given my wiki has no users
  When I visit the homepage
  Then I should see the Setup User page

Scenario: Creating the first user doesn't require authentication
  Given my wiki has no users
  And I am on the Setup User page
  When I submit the New User form
  Then my wiki should have 1 user

Scenario: Creating the first user logs me in as that user
  Given my wiki has no users
  And I am on the Setup User page
  When I submit the New User form with username "Alice"
  Then I should be logged in as User "Alice"

Scenario: A wiki with no posts prompts to create a first post
  Given my wiki has no posts
  And I am logged in as User "Alice"
  When I visit the homepage
  Then I should see the Create First Post page

Scenario: Creating the first post
  Given my wiki has no posts
  And I am logged in as User "Alice"
  And I am on the Create First Post page
  When I submit the New Post form with text about "Wonderland"
  Then I should see the Post "Wonderland"

