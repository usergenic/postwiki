Feature: Semantic Link
  In order to describe the relationships between Posts in my Postwiki
  As an author
  I want to add tags to my Post Links

Prerequisites:
  - Post Link

Background:
  Given a Post "Luke Skywalker"
  And a Post "Darth Vader"
  And a Post "Princess Leia"
  And the Post "Luke Skywalker" has no Post Links
  And the Post "Darth Vader" has no Post Links
  And the Post "Princess Leia" has no Post Links

Scenario: Tagging a Post Link
  When I append the following text to the Post "Luke Skywalker"
    """
    Has a love/hate relationship with [Darth Vader #father].
    """
  Then the Post "Luke Skywalker" should have 1 Post Link with the following
    | source         | tags   | target      |
    | Luke Skywalker | father | Darth Vader |
  And the Post "Darth Vader" should have 1 Post Link with the following
    | source         | tags   | target      |
    | Luke Skywalker | father | Darth Vader |
  And the Post "Princess Leia" should have no Post Links

Scenario: Tagging multiple Post Links
  When I append the following text to the Post "Luke Skywalker"
    """
    Has a love/hate relationship with [Darth Vader #father].
    Has mixed feelings about [Princess Leia #sister].
    """
  And I append the following text to the Post "Darth Vader"
    """
    Doesn't know whether to hug or kill [Luke Skywalker #son].
    Never suspected he was related to [Princess Leia #daughter].
    """
  And I append the following text to the Post "Princess Leia"
    """
    Despises her biological father [Darth Vader #father].
    Has less force power than her brother [Luke Skywalker #brother].
    """
  Then the Post "Luke Skywalker" should have 4 Post Links with the following
    | source         | tags     | target         |
    | Darth Vader    | son      | Luke Skywalker |
    | Luke Skywalker | father   | Darth Vader    |
    | Luke Skywalker | sister   | Princess Leia  |
    | Princess Leia  | brother  | Luke Skywalker |
  And the Post "Darth Vader" should have 3 Post Links with the following
    | source         | tags     | target        |
    | Darth Vader    | daughter | Princess Leia |
    | Luke Skywalker | father   | Darth Vader   |
    | Princess Leia  | father   | Darth Vader   |
  And the Post "Princess Leia" should have 4 Post Links with the following
    | source         | tag      | target         |
    | Darth Vader    | daughter | Princess Leia  |
    | Luke Skywalker | sister   | Princess Leia  |
    | Princess Leia  | brother  | Luke Skywalker |
    | Princess Leia  | father   | Darth Vader    |

