require "bundler/capistrano"



server "96.126.113.242", :web, :app, :db, primary: true

set :application, "pa03"
set :user, "root"
set :deploy_to, "/home/deploy/rails32/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true

set :scm, "git"
set :repository, "git@github.com:gabemcmillan/#{application}.git"
set :branch, "master"



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