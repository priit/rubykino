require 'capistrano/ext/multistage'
require 'bundler/capistrano'
require "whenever/capistrano"

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

set :whenever_command, "bundle exec whenever"

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
    run "cd #{release_path}/ && bundle exec rake assets:precompile"  
  end  
end

