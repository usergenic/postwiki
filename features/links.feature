Feature: Links
In order to refer to other Posts in my Wiki
As an author
I want to provide Links in my Posts

Background:
Given I am logged in as "alan1"

Scenario: Identified Link Target
Given a Post named "Flynn"
And a Post named "Tron"
When I Link to "Tron" from "Flynn"
Then "Flynn" should have a Link

Scenario: Unknown Link Target
Given a Post named "Flynn"
When I Link to "Tron" from "Flynn"
Then "Flynn" should have a Link

Scenario: Ambiguous Link Target
Given a Post named "Flynn"
And a Post named "Recognizer"

---

  usergenic.com
  =============

  todos
  -----
  {{ select name from posts where


---

  danbroadley.com
  ===============

  Dan's artist website.

  todos
  -----

   * [add dns on point hq]
   * [update ns on godaddy]
   * [deploy to heroku]

---

  danbroadley.com/add dns on point hq
  ===================================

---

Disambiguation options:

prefix with the name of a post that links to it.

When a post is added to the Wiki that contains the same name as another Post,
and the existing Post has Links to it, then both Posts should have their names
changed and Links to the existing Post should be updated to use the more
qualified form of the name.

   should have its name changedall Posts which Link to the existing Post
