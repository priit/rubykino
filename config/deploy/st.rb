require "rvm/capistrano" 
set :rvm_ruby_string, '2.0.0' 

# =============================================================================
# MULTISTAGE
# =============================================================================
role :app, 'rubykino'
role :db,  'rubykino', :primary => true

set :use_sudo, false
set :branch, 'pr'
set :deploy_to, '/home/rubykino/rubykino'

#require 'hoptoad_notifier/capistrano'
