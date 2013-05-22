class User < ActiveRecord::Base
  serialize :env, Hash
end
