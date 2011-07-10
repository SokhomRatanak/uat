# @see http://help.github.com/deploy-with-capistrano/

default_run_options[:pty] = true  # Must be set for the password prompt from git to work

server 'josephson.mocsystems.com', :app, :web, :db
  
# Defining which stages we use on the server
set :stages, %w(integration)
set :default_stage, 'integration'

# Set variables used for all stages
set :application, "typo3v4-core"
set :deploy_to, "/home/jenkins/repo/typo3_src/"

set :repository,  "git://git.typo3.org/TYPO3v4/Core.git"
set :scm, :git
set :branch, "master"
set :deploy_via, :remote_cache
set :shared_children, %w() 

set :user, 'jenkins'
set :ssh_options, { :forward_agent => true }
set :git_enable_submodules, 1

# Creating dependencies if needed
depend :local, :command, "git"
depend :remote, :directory, "#{deploy_to}"

before "git:pull", "environment:clean", "git:setup"

namespace :environment do
  desc "Cleanup environment"
  task :clean do
    sudo "./bin/typo3_restore_testsite.sh"
    puts "Cleaned up environment"
  end
end

namespace :git do
  desc "Setup git properties"
  task :setup do
    run "git config --global user.name 'Mr. Jenkins'"
    run "git config --global user.email ci-admin@typo3.org"
    puts "Setup git properties"
  end

  desc "Get latest revision"
  task :pull do
    run "cd #{deploy_to} && git reset --hard origin/master && git pull && git submodule update"
    puts "Merged gerrit pull request"
  end
  
  desc "Integrating the patch into master."
  task :cherry_pick do
    run "cd #{deploy_to} && git fetch #{gerrit_parameters} && git cherry-pick FETCH_HEAD"
    puts "Cherry-picked gerrit pull request - #{gerrit_parameters}"
  end
end

namespace :tests do
  desc "Run tests on project"
  task :execute do
    run "rm -f /tmp/phpunit.xml"
    #run "/usr/bin/php /home/testsite/htdocs/typo3/cli_dispatch.phpsh phpunit --log-junit /tmp/phpunit.xml /home/testsite/htdocs/typo3_src/tests/ || true"
    run "/usr/bin/php /home/testsite/htdocs/typo3/cli_dispatch.phpsh phpunit --log-junit /tmp/phpunit.xml /home/testsite/htdocs/typo3_src/tests/ || true" do |channel, stream, data|
      channel[stream] ||= ''
      channel[stream] << data
      if data[-1..-1] == "\n"
        puts channel[stream]
        channel[stream] = ''
      end
    end
    puts "UnitTests complete"
  end
  
  desc "Integrating the patch into master."
  task :download_results do
    top.download("/tmp/phpunit.xml", "./build/logs/", :via => :scp, :recursive => true)
    puts "Downloading results for phpunit"
  end
end
