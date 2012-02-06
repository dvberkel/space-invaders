Space Invaders
==============

This project is an entry in the 2012 [Devnology](http://devnology.nl/ "Devnology homepage")
[Code Fest](http://devnology.nl/en/meetings/details/44-code-fest-space-invaders "Devnology detailpage on 2012 Code Fest).

Introduction
------------

For an introduction to [Space Invaders](http://en.wikipedia.org/wiki/Space_Invaders "Wikipedia on Space Invaders") see
wikipedia.

Devnology's mission can be found on the [about page](http://devnology.nl/en/about-devnology "About Devnology").

Language
--------

The language for this project is [Ruby](http://www.ruby-lang.org/en/ "The Ruby website").
it is chosen in order to gain experience with the language. In
particular I am interested in broadening my knowledge about

* [Rake](http://rake.rubyforge.org/ "Documentation on Ruby Make")
* [Cucumber](http://cukes.info/ "Cucumber website")
* [RSpec](http://rspec.info/ "Documentation on RSPec")
* [Bundler](http://gembundler.com/ "Bundler website")

Setup
-----

We are using Ruby Version Manager ([rvm](http://beginrescueend.com/ "Documentation on rvm"))
to control which version of ruby and gems we are using. The following
setup was used to start developing

    > rvm use 1.9.2
    > rvm gemset create invaders
    > rvm use 1.9.2@invaders

We are using [Bundler](http://gembundler.com/ "Bundler website") to
control the gem versions. Use the following command to fetch all
necessary gems.

    > bundle install