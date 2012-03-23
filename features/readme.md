Under Construction
==================

This is a work in progress and has not yet been released.  When this project is
operational, this README will be updated to reflect that.  For now, you are
looking at something between software and vaporware, or as I like to call it
"aspirationware".

Design Goals of Postwiki
------------------------

* Semantic links turn what would otherwise be purely opaque text content into
  machine-usable information.  Linking in Postwiki will support qualifiers or
  "tags" which turn ordinary links into the equivalent of RDF triples aka
  `subject->property->object`.

* Sparql or other query language support for embedding dynamic content within
  posts, so you could produce a list or table of all posts by properties or
  having certain relationships through semantic links.

* It should be very easy to programatically interact with the wiki through an
  API thus extending the value of its content and relational structures.  I
  foresee several applications that I would build when the core features are in
  place.

* Markup language should be minimalistic, natural and obvious.  I am choosing
  Markdown as the basis for the wikitext with a couple simple enhancements to
  make it even easier to link to other posts in the same wiki.

* Storage layer should be abstracted and interchangeable from the logical wiki
  application code.  This is because there are unique advantages to supporting
  multiple classes of storage:

  * Simple SQLite database for personal or small team wikis.

  * MySQL database backend for a range of wiki applications.

  * Git-based file store: you can interact with the files as assets directly if
    you keep the data of the wiki in a git repository as flat-files.  This
    allows all kinds of asset repurposing.

  * CassandraCQL store: massive distributed data store allows for web-scale wiki
    installations and possibly a Postwiki-as-a-service venture some day.


