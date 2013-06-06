require 'rvm/capistrano'
set :rvm_type, :user

require 'bundler/capistrano'

set :application, "railsc.localhost"
role :web, "localhost"
role :app, "localhost"
role :db,  "localhost", :primary => true


default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/railsc"
set :deploy_via, :remote_cache
set :user, "czlowieq"
set :use_sudo, false

set :scm, :git
set :scm_username, "ppawlikmb"
set :repository, "git@github.com:kulerskim/ib-rails.git"
set :branch, "master"
set :git_enable_submodules, 1

namespace :deploy do
  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  desc "Precompile assets"
  task :precompile, :role => :app do
    run "cd #{release_path}/ && rake assets:precompile"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
after "deploy:finalize_update", "deploy:precompile"
