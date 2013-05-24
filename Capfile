load 'deploy' if respond_to?(:namespace)
load 'config/deploy'

set :stages, %w(st pr)
set :default_stage, 'st'
require 'capistrano/ext/multistage'
