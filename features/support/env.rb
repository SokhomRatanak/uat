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

World(Capybara)
