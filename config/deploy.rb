# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "sos"
set :repo_url, "git@github.com:Heahmund/SOS.git"

# Default branch is :Second
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/musaev/deployer/sos"
set :deploy_user, "musaev"
# Default value for :format is :airbrussh.
set :format, :pretty



# Default value for :linked_files is []
append :linked_files, %w{config/database.yml 'config/private_pub.yml'}

# Default value for linked_dirs is []
append :linked_dirs, "bin", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system"

# Default value for local_user is ENV['USER']

# Uncomment the following to require manually verifying the host key before first deploy.
#  ssh_options: { user: 'deployer', forward_agent: true,  auth_methods: %w(publickey password), port: 2222 }
 
namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end