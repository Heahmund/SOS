# config valid for current version and patch releases of Capistrano
lock "~> 3.17.1"

set :application, "SOS"
set :repo_url, "git@github.com:Heahmund/SOS.git"

# Default branch is :Second
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/musaev/sos"
set :deploy_user, 'musaev'
# Default value for :format is :airbrussh.
set :conditionally_migrate, true
set :format, :pretty



# Default value for :linked_files is []
append :linked_files, "config/database.yml", "config/private_pub.yml", "config/private_pub_thin.yml", ".env"

# Default value for linked_dirs is []
append :linked_dirs, "bin", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system", "public/uploads"


# Default value for local_user is ENV['USER']

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


namespace :private_pub do

  desc 'Start pub'
  task :start do
    on roles(:app) do
     within current_path do
      with rails_env: fetch(:rails_env)do
        execute :bundle, "exec thin -C config/private_pub_thin.yml start"
      end
    end
  end
end
desc 'Stop pub'
task :stop do
  on roles(:app) do
   within current_path do
    with rails_env: fetch(:rails_env)do
      execute :bundle, "exec thin -C config/private_pub_thin.yml stop"
    end
  end
end
end
desc 'Restart pub'
task :restart do
  on roles(:app) do
    within current_path do
      with rails_env: fetch(:rails_env)do
        execute :bundle, "exec thin -C config/private_pub_thin.yml restart"
      end
    end
  end
end
end

after 'deploy:restart', 'private_pub:restart'