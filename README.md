#  Dibsy [http://dibsylist.com](http://dibsylist.com)

Dibsy lets you create and share lists, and call dibs on items in those lists.

## Development Notes &amp; Resources
- [Configuring Ruby 1.9.3-p0 and Rails 3.1.3 with RVM](http://railsapps.github.com/installing-rails-3-1.html)
  - Using [Ruby 1.9.3 p0](http://www.ruby-lang.org/en/downloads/) (Recommended as of Tue 10, Jan 2012)
  - Using [Rubygems 1.8.15](https://rubygems.org/gems/rubygems-update) (Recommended as of Tue 10, Jan 2012)
  - Using [Rake 0.9.2.2](http://rubygems.org/gems/rake) (Recommended as of Tue 10, Jan 2012)
  - Using [Rails 3.1.3](http://rubygems.org/gems/rails) (Recommended as of Tue 10, Jan 2012)
  - Using [RVM 1.8](http://beginrescueend.com/)
- Deployed to Heroku following instructions [here](http://railsapps.github.com/rails-heroku-tutorial.html).
  - At first it didn't work. Looks like Heroku wasn't precompiling assets, and the missing resources was causing a 500 error? Anyway, precompile locally with ``RAILS_ENV=production bundle exec rake assets:precompile`` … and then pushed that up to Heroku, and it seems to be working.
  - 

