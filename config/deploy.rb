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


namespace :git do
  desc "Get latest revision"
  task :pull do
    run "cwd #{deploy_to}"
    run "git checkout master && git pull"
    puts "merge gerrit pull request"
  end
  
  desc "Replace folder 'current' with symlink, if present."
  task :cherry_pick do
    run "cwd #{deploy_to}"
    run "git fetch git://git.typo3.org/TYPO3v4/Core refs/changes/27/3227/1 && git cherry-pick FETCH_HEAD"
    run "git status"
  end
end
