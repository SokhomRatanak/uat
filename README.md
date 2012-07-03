# Overview

This project helps you get started with User Acceptance Tests.

Have a look in features/smoke_test.feature to see how easy it is to
write simple but yet effective tests.

## Requirements

* The Setup has been tested on MacOSX 10.6 (Snow Leopard) and MacOSX 10.7
(Lion). Other OS should work too if a Ruby development environment is available (see Installation-Details below).
* Tested with Ruby 1.8.7 and Ruby 1.9.3
Check your Ruby version with these commands (output may vary due to your
Ruby version):
<pre>
$ ruby -v
ruby 1.8.7 (2011-06-30 patchlevel 352) [i686-darwin10.8.0]
</pre>
* Rubygems > 1.8
<pre>
$ gem -v
1.8.11
</pre>


## Install

	gem update --system
	gem install bundler --no-ri --no-rdoc
	git clone git://github.com/typo3-ci/uat.git
	cd uat
	bundle install
	bundle exec cucumber CUCUMBER_HOST=http://demo.typo3.org/

You can change the variable CUCUMBER_HOST to whatever introduction package you may have.
*The trailing slash is required.*


### Setup Ruby on a vanilla Fedora system

Install these packages to get a working Ruby development environment
running:

	$ yum install libxml2-devel libxslt-devel
	$ yum install libffi-devel
	$ yum install ruby-gems ruby-devel


## Usage

Call all tests with

	bundle exec cucumber CUCUMBER_HOST=http://demo.typo3.org/

Call a single feature test with

	bundle exec cucumber CUCUMBER_HOST=http://demo.typo3.org/ features/example.feature

For more details please see https://github.com/cucumber/cucumber/wiki/


## Contribute

* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not mess with Gemfile, or history.
* Send me a pull request. Bonus points for topic branches.

