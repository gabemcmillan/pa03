require "bundler/capistrano"

# If you're using Thinking Sphinx as a gem (Rails 3 way):
require 'thinking_sphinx/deploy/capistrano'


server "96.126.113.242", :web, :app, :db, primary: true

set :application, "pa03"
set :user, "root"
set :deploy_to, "/home/deploy/rails32/#{application}"
set :shared_path, "/home/deploy/rails32/#{application}/shared"

set :deploy_via, :remote_cache
set :use_sudo, true

set :scm, "git"
set :repository, "git@github.com:gabemcmillan/#{application}.git"
set :branch, "master"


#thinking sphinx code for version 2 
#before 'deploy:update_code', 'thinking_sphinx:stop'
#after  'deploy:update_code', 'thinking_sphinx:start'
#namespace :sphinx do
#  desc "Symlink Sphinx indexes"
#  task :symlink_indexes, :roles => [:app] do
#    run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
#  end
#end
#after 'deploy:finalize_update', 'sphinx:symlink_indexes'


#create symlink for databse.yml from shared directory
before "deploy:assets:precompile" do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end



default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do

#  %w[start stop restart].each do |command|
#    desc "#{command} unicorn server"
#    task command, roles: :app, except: {no_release: true} do
#      run "/etc/init.d/unicorn #{command}"
#    end
#  end


  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
end