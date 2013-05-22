class Vote < ActiveRecord::Base
  belongs_to :video, :counter_cache => true
  belongs_to :user
  attr_accessible :video_id

  validates :video_id, :uniqueness => {:scope => :user_id}
end
