# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "sos"
set :repo_url, "git@github.com:Heahmund/SOS.git"

# Default branch is :Second
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/deployer/sos"
set :deploy_user, "musaev"
# Default value for :format is :airbrussh.
set :format, :pretty

set :local_user

# Default value for :linked_files is []
append :linked_files, %w{config/database.yml 'config/master.key' 'config/private_pub.yml'}

# Default value for linked_dirs is []
append :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets tmp/webpacker public/system vendor storage}

# Default value for local_user is ENV['USER']
set :local_user, "musaev"

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end