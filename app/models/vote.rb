class Vote < ActiveRecord::Base
  attr_accessible :user_id, :video_id
end
