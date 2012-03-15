Tagit
=====

Tagit exists because I tag my Rails releases in a human-readable way and I like to get my 
application to tell me what version I'm currently running on.  I tag using git and I use
the RubyGems [rational versioning system](http://docs.rubygems.org/read/chapter/7).  Yes, you
can tag with Capistrano, but I don't like the huge tags. I'm much happier discussing what we fixed 
in `v1.2` than I am discussing what we fixed in `production_24012012989734`.

If you tag your releases with human-readable numbers yourself, this gem gives you a 
so-stupid-it-might-be-clever engine that shows you what version you're currently on, based on 
the largest rational tag currently in git.

In your Gemfile, add
 
    gem 'tagit'
    
You can then add a line to `config/routes.rb` like

    mount Tagit::Engine => '/versions', :as => 'versions'
    
and visit:

* `/versions/current` for the current version
* `/versions` for a list of versions

