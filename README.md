Postwiki
========

*WORK IN PROGRESS*

A wiki with semantic links.

Installation
------------

Assuming you have [Ruby][1] installed, you should be able to install Postwiki via [Rubygems][2].

    $ gem install postwiki
    Successfully installed postwiki-0.0.1
    1 gem installed

Quick Start
-----------

Postwiki wants to use a git repository for its storage.  When you start Postwiki
up, it expects an argument that tells it where the repository is located on the
filesystem.  If you don't provide an argument, it will assume the current
working directory.

    $ postwiki
    Postwiki listening on port 8181

Postwiki has a relatively simple authentication model.  By default, the wiki

Pages
-----

Postwiki is designed to be easy to use in a web-browser as well as
programatically.

Creating a page on the wiki is very simple.  Just visit a URL on the wiki that
doesn't exist yet and it will prompt you to create a page for it.

     $ curl -sI http://localhost:8181/some-page-that-doesnt-exist
     HTTP/1.1 404 Not Found
     Content-Type: text/html
     Connection: keep-alive

Editing a page is easy, just pop ?edit on the querystring to view the page's
edit form.

     http://localhost:8181/some-page-that-doesnt-exist?edit

Links
-----

Semantic Links
--------------

