class Video < ActiveRecord::Base
  attr_accessible :title, :url, :user_id

  validates :title, :url, :presence => true

  has_many :votes

  class << self
    def top
      order('votes_count desc').where('videos.disabled_at IS NULL').
        where('videos.watched_at IS NULL')
    end

    def previous
      order('created_at desc').where('videos.disabled_at IS NULL').
        where('videos.watched_at IS NOT NULL')
    end
  end
end
