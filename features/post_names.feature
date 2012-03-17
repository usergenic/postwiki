Feature: Post Names
  In order to easily refer to the Posts in my Wiki
  As an author
  I want to use their Names

Background:
  Given I am logged in

Scenario: The Name of a Post is the first line of Text
  When I create a Post with the following WikiText
    """
    My Post
    Is Good
    """
  Then I should see the Post has the Name "My Post"

Scenario: Find a Post by its Name
  Given a Post #1 with the Name "X"
  When I visit the Post URL using Name "X"
  Then I should see Post #1

Scenario: Finding multiple Posts with identical Names
  Given a Post #1 with the Name "X"
  And a Post #2 with the Name "X"
  When I visit the Post URL using Name "X"
  Then I should see the Disambiguation Page for Name "X"
  And I should see a Link to Post #1
  And I should see a Link to Post #2

Scenario: Linking to a Post using its Name within a Namespace
  Given a Post #1 with the Name "A/X"
  And a Post #2 with the Name "X"
  And a Post with the following WikiText
    """
    A/Y
    [X]
    """
  When I visit the Post URL using Name "A/Y"
  And I follow the Link to "X"
  Then I should see Post #1

Scenario: Linking to a Post outside the current Namespace
  Given a Post #1 with the Name "A/X"
  And a Post #2 with the Name "X"
  And a Post with the following WikiText
    """
    A/Y
    [/X]
    """
  When I visit the Post URL using name "A/Y"
  And I follow the Link to "X"
  Then I should see Post #2
