set :use_sudo, false

set :user, "deployer"
set :scm, :git
set :application, "infrastructureapp"
set :deploy_to, "/home/deployer/apps/#{application}"

# Use the public or private clone URL, if you have a public or private repository.
set :repository,  "git://github.com/richardkmichael/infrastructureapp.git"
# set :repository,  "git@github.com:richardkmichael/infrastructureapp.git"

role :web, "ubuntu.home."
role :app, "ubuntu.home."
role :db,  "ubuntu.home.", :primary => true

# RVM settings.
set :rvm_ruby_string, "ruby-1.9.3-p194@infrastructureapp"
# set :rvm_install_type, :stable
# set :rvm_install_ruby, :reinstall
require "rvm/capistrano"
before "deploy:setup", "rvm:install_rvm"
before "deploy:setup", "rvm:install_ruby"

# Optional settings.
# set :branch, "production"
# set :scm_passphrase, "github_password"
# ssh_options[:forward_agent] = true # Keep ssh keys on the local machine.

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
