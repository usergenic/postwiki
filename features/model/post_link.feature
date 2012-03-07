Feature: Link
  In order to reference other Posts in my Posts
  An an author
  I want to define Links

Background:
  Given a Post "Alice"
  And a Post "Wonderland"
  And the Post "Alice" has no Links
  And the Post "Wonderland" has no Links

Scenario: Defining a Link
  When I append the following text to the Post "Alice"
    """
    Currently residing in [Wonderland]
    """
  Then the Post "Alice" should have 1 Link with the following
    | source | target     |
    | Alice  | Wonderland |
  And the Post "Wonderland" should have 1 Link with the following
    | source | target     |
    | Alice  | Wonderland |

Scenario: Removing a Post by updating the source text
  Given the following Link
    | source | target     |
    | Alice  | Wonderland |
  When I change the text of the Post "Alice" to the following
    """
    Alice no longer visits the place that shall not be named.
    """
  Then the Post "Alice" should have no Links

Scenario: Changing the text of the target does not modify Link
  Given the following Link
    | source | target     |
    | Alice  | Wonderland |
  When I change the text of the Post "Wonderland" to the following
    """
    We're all mad here.
    """
  Then the Post "Alice" should have 1 Link with the following
    | source | target     |
    | Alice  | Wonderland |
