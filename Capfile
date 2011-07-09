load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

# Require the multistage environments
require 'capistrano/ext/multistage'

load 'config/deploy'