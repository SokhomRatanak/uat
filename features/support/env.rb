require 'rubygems'

# Capybara configuration (using Akephalos)
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara/session'
require 'akephalos'

# Enable CLI Steps for Cucumber
require 'aruba/cucumber'

# RSpec
#require 'spec/expectations'

# TestUnit
require 'test/unit/assertions'


unless ENV['CUCUMBER_HOST']
  puts 'You MUST provide the argument CUCUMBER_HOST in order to run cucumber tests. Example: cucumber CUCUMBER_HOST=http://www.example.com/'
  exit(1)
end

Capybara.default_selector = :css
Capybara.default_driver = :akephalos
Capybara.javascript_driver = :akephalos
Capybara.run_server = false
Capybara.app_host = ENV['CUCUMBER_HOST']

Capybara.register_driver :akephalos do |app|
  # available options:
  #   :ie6, :ie7, :ie8, :firefox_3, :firefox_3_6
  Capybara::Driver::Akephalos.new(app, :browser => :firefox_3_6)
end

World(Test::Unit::Assertions)
World(Capybara)

Before('@slow_process') do
  @aruba_io_wait_seconds = 15
end