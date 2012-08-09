require 'rubygems'
require 'uri'
require 'cgi'

require 'capybara/cucumber'
require 'capybara/poltergeist'

Capybara.default_driver = :poltergeist
Capybara.current_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.run_server = false
Capybara.app_host = ENV['CUCUMBER_HOST']

# INFO ct 2012-08-9 Change driver to selenium. This way a firefox browser will be opened and used for the tests.
# This also requires some changes to the steps eg. screenshot steps
# Because capybara does not handle the screenshot API IIRC
# Capybara.default_driver = Capybara.current_driver = :selenium

World(Capybara)
