WikiText
========

The content of a [Post] is recorded in WikiText, which is a superset of the
lightweight syntax for web content authoring known as [Markdown][1].

The essential difference between Markdown and WikiText is the addition of a
syntax for inter-Post [Linking][Link].

If you are familiar with Markdown, you know that `[display text][reference]` is
the way you specify external links in your documents.  Markdown's existing
linking behavior is essentially unaffected.

If you surround any word or phrase in square brackets `[like this]`, then
PostWiki will treat it as a Link to another Post.

If you use a `[display text][reference]` style link in your document and there
is nothing found in the document matching "`[reference]: ...`" then it will
treat `[reference]` as a Link to a Post called "reference".

