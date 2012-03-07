Feature: Change History
  In order to not lose important information
  As an author
  I want to have all changes to Posts journaled in a history

Scenario: One History entry created with new Post
  When I create a Post "Metallica" with the following text
    """
    Once upon a time this band was awesome.
    """
  Then the Post "Metallica" should have 1 History with the following
    | text      | version |
    | /awesome/ | 1       |

Scenario: Updating a Post creates a new History entry
  Given a Post "Metallica" with the following text
    """
    Once upon a time this band was awesome.
    """
  When I change the text of the Post "Metallica" to the following
    """
    Something happened and now this band is total crap.
    """
  Then the Post "Metallica" should have 2 Histories with the following
    | text      | version |
    | /crap/    | 2       |
    | /awesome/ | 1       |
