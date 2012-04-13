# Overview

This project helps you get started with User Acceptance Tests.

## Requirements

* The Setup has been tested on MacOSX 10.6 (Snow Leopard) and MacOSX 10.7
(Lion). Other OS should work too if a Ruby development environment is available (see Installation-Details below).

* Ruby 1.8.7

Ruby 1.9.2 is not supported yet, due to an issue with the `johnson` gem (http://isitruby19.com/johnson) which is needed by the `capybara-envjs` gem. You can check the ruby version with:

  $ ruby -v
  ruby -v
  ruby 1.8.7 (2011-06-30 patchlevel 352) [i686-darwin10.8.0]

* Rubygems > 1.8

  $ gem -v
  1.8.11


## Install

	gem update --system
	gem install bundler --no-ri --no-rdoc
	git clone git://github.com/typo3-ci/uat.git
	cd uat
	bundle install
	bundle exec cucumber CUCUMBER_HOST=http://example.com/

You can change the variable CUCUMBER_HOST to whatever introduction package you may have.
The trailing slash is required.


### Setup Ruby on a vanilla Fedora system

Install these packages to get a working Ruby development environment
running:

  $ yum install libxml2-devel libxslt-devel
  $ yum install libffi-devel
  $ yum install ruby-gems ruby-devel


## Jenkins public key

Please use this public key to allow ci.typo3.org to access your machine:
	ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAwHIC3bY+2Vth2rGjfkUELHaAZME6z4PU+L53Enlkyo8+MhFWfByVWSWugGSyqeOM2Z+ThHBS8mZ+xmR4vRU1L/mQ9KpcNkClkikhpkBeRvJ+OFP5QdjR8yEz0kz8DmvMlrAL4gd6PuzrWSQluTmGto+TBeE38G210xgDAu1jgk6+V530BO/+7OJ2InCWOlDJXmn3e47XIMddt7jr4gfwdzNp/gdeYki54fp3Sx/Wa88WdwfsCLCyYmfSp+Ld9ncmeS7Hp3R/aL6C3qeLQYsV0DgjtJm8h3NAh/fldbZ91x4vCxpAR0ccSuDUeGOJO388wvxVibmEI66SF96shOS41w== jenkins@ci.typo3.org


## Links

* Testing ExtJS with Cucumber: http://blog.writelesscode.com/blog/2011/01/27/testing-extjs-rails-components-with-cucumber-and-webdriver-in-netzke/
