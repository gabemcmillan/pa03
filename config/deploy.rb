require "bundler/capistrano"

server "96.126.113.242", :web, :app, :db, primary: true

set :user, 'deploy'
set :domain, 'pathadvisor.org'
set :application, "PathAdvisor"
 
set :repository, "https://github.com/gabemcmillan/#{application}.git"  # Your clone URL
set :scm, "git"
set :branch, "master"
set :scm_verbose, true
set :deploy_via, :remote_cache
set :scm_passphrase, "copley66"  # The deploy user's password
set :deploy_to, "/home/#{user}/rails32/#{application}"
set :use_sudo, false
 
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
 
role :web, domain                         # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run
 
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

 task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

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
