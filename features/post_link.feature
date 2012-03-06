Feature: Post Link
  In order to reference other Posts in my Posts
  An an author
  I want to define Post Links

Background:
  Given a Post "Alice"
  And a Post "Wonderland"
  And the Post "Alice" has no Post Links
  And the Post "Wonderland" has no Post Links

Scenario: Defining a Post Link
  When I append the following text to the Post "Alice"
    """
    Currently residing in [Wonderland]
    """
  Then the Post "Alice" should have 1 Post Link with the following
    | source | target     |
    | Alice  | Wonderland |
  And the Post "Wonderland" should have 1 Post Link with the following
    | source | target     |
    | Alice  | Wonderland |

Scenario: Removing a Post Link by updating the source text
  Given the following Post Link
    | source | target     |
    | Alice  | Wonderland |
  When I change the text of the Post "Alice" to the following
    """
    Alice no longer visits the place that shall not be named.
    """
  Then the Post "Alice" should have no Post Links

Scenario: Changing the text of the target does not modify Post Link
  Given the following Post Link
    | source | target     |
    | Alice  | Wonderland |
  When I change the text of the Post "Wonderland" to the following
    """
    We're all mad here.
    """
  Then the Post "Alice" should have 1 Post Link with the following
    | source | target     |
    | Alice  | Wonderland |
