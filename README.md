# How to setup Cucumber

This document helps you to set up the environment for running User Acceptance Tests (UAT).

## What is Cucumber?

Cucumber is a [Rubygem](http://rubygems.org/gems/cucumber) written in [Ruby library](http://www.ruby-lang.org). The official website is [http://cukes.info/](http://cukes.info/).

Cucumber allows us to write powerful tests in plain English:
<pre><code class="ruby">
  Scenario: I see a warm welcome message
    Given I am on "home"
    Then I should see "Welcome!"
</code></pre>


## Installation

### Requirements

* The Setup has been tested on MacOSX 10.6 (Snow Leopard), MacOSX 10.7 (Lion) and Ubuntu 12.04 64bit.
* Other OS should work too if a Ruby development environment is available (see Installation-Details below).
* Tested with Ruby 1.8.7 and Ruby 1.9.3
Check your Ruby version with these commands (output may vary due to your Ruby version):
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

You first need a Ruby environment and [PhantomJS](https://github.com/jonleighton/poltergeist#installing-phantomjs) to execute the tests on your machine.

If you don't have a Ruby environment we recommend following these instructions: [https://rvm.io/rvm/install/](https://rvm.io/rvm/install/)

All required Rubygems come with the `Gemfile` and are installed by Bundler.


### Mac OS X

Update your Rubygems environment and install `bundler` and `phantomjs`:

	gem update --system
	gem install bundler --no-ri --no-rdoc
	brew install phantomjs

Now Install the XML libs required by [nokogiri requirements](http://nokogiri.org/tutorials/installing_nokogiri.html).
	

### Linux

This installation requires a 64bit system. See [https://github.com/jonleighton/poltergeist#installing-phantomjs](https://github.com/jonleighton/poltergeist#installing-phantomjs) for other platforms.

1. Download this file to your Download folder: [http://phantomjs.googlecode.com/files/phantomjs-1.6.1-linux-x86_64-dynamic.tar.bz2](http://phantomjs.googlecode.com/files/phantomjs-1.6.1-linux-x86_64-dynamic.tar.bz2)
2. Open the Terminal and run these commands (*Do NOT change the path names!*):
<pre>
cd ~/Downloads/
sudo tar xvjf phantomjs-1.6.1-linux-*-dynamic.tar.bz2 -C /usr/local
sudo ln -s /usr/local/phantomjs-1.6.1-linux*/bin/phantomjs /usr/local/bin/phantomjs
</pre>
3. Install XMLlib header for "nokogiri requirements":http://nokogiri.org/tutorials/installing_nokogiri.html
<pre>sudo apt-get install libxslt-dev libxml2-dev</pre>
4. Now run this command:
<pre>bundle</pre>This can take a while because it downloads and installs all the ruby libraries needed to run the tests.


### Setup Ruby on a vanilla Fedora system

Install these packages to get a working Ruby development environment running:

	$ yum install libxml2-devel libxslt-devel
	$ yum install libffi-devel
	$ yum install ruby-gems ruby-devel


## Running the tests

Checkout the repo, run `bundle` and call `cucumber`:

	git clone git://github.com/typo3-ci/uat.git
	cd uat
	bundle
	cucumber

All tests are stored in `.feature`-files that are stored under the folder `features`.

To call a specific test call `cucumber` like this:

	cucumber features/example.feature


## File structure

This is the file structure in details:
<pre>
.
├── Gemfile                    <- Information about Rubygems we use
├── Gemfile.lock               <- Dependencies for all Rubygems we use
├── README.md                  <- The awesome file you are reading right now!
├── config                     <- Project configurations for running tests, deployments etc.
│   └── cucumber.yml           <- Cucumber settings (profiles, URLs etc.)
└── features                   <- Feature tests that are executed by cucumber
    ├── example.feature        <- A feature description with one or more test scenarios. Add as many .feature files as you like
    ├── step_definitions       <- Steps you can use in your test scenarios
    │   ├── common_steps.rb    <- Steps for common actions
    │   └── new_steps.rb       <- Your new steps here. Feel free to add more files according to the use cases
    └── support                <- Files for setting up and extending Cucumber
        ├── env.rb             <- Set up the Cucumber environment
        ├── hooks.rb           <- Customize Cucumber behavior
        ├── path.rb            <- Translate URL paths to keywords. Example: /menu/sitemap => "sitemap". This is useful to make the tests more readable but can add extra complexity. Handle with care!
        ├── selectors.rb       <- Translate CSS selectors to keywords. Example: #content_main => "content". This is useful to make the tests more readable but can add extra complexity. Handle with care!
        └── with.rb            <- Register methods to make steps more flexible
</pre>

# Questions

Q: I want to add a new URL for testing<br>
A: Please see `config/cucumber.yml` to change the target website eg. if you want to tests another project. You can change the variable CUCUMBER_HOST to whatever introduction package you may have. **The trailing slash is required.**

Q: I want to run only particular tests<br>
A: If you want to run only particular feature tests call `cucumber` like this
<pre>cucumber features/example.feature</pre>


## Links

- [Poltergeist](https://github.com/jonleighton/poltergeist)
- [Cucumber](https://github.com/cucumber/cucumber/wiki/)


## Author

Christian Trabold <<typo3@christian-trabold.de>>


## Contribute

* Fork the project.
* Make your feature addition or bug fix.
* Commit, do not mess with Gemfile, or history.
* Send me a pull request. Bonus points for topic branches.

