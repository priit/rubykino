require 'capistrano/ext/multistage'
require 'bundler/capistrano'

#=============================================================================
# REQUIRED VARIABLES
# =============================================================================

set :application, 'rubykino'
set :repository,  'git://github.com/priit/rubykino.git'

set :stages, %w(st pr)
set :default_stage, 'st'

set :scm, :git
set :scm_verbose, true
set :deploy_via, :remote_cache

set :deploy_to, "/home/rubykino/rubykino"

default_run_options[:pty] = true

set :bundle_flags, '--deployment'

# =============================================================================
# SERVER RESTART
# =============================================================================

namespace :deploy do
  task :restart, :roles => :app do
    sudo "/etc/init.d/nginx reload"
  end
end

# =============================================================================
# HOOKS
# =============================================================================

after "deploy:finalize_update", "deploy:precompile"
after "deploy", "deploy:cleanup"

namespace :deploy do
  task :precompile, :role => :app do  
    run "cp #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "cp #{shared_path}/config/initializers/secret_token.rb #{release_path}/config/initializers/secret_token.rb"
    run "cd #{release_path}/ && rake assets:precompile"  
  end  
end
