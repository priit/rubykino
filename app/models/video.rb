class Video < ActiveRecord::Base
  attr_accessible :length, :title, :url, :user_id

  validates :title, :url, :presence => true

  has_many :votes

  class << self
    def top
      order('votes_count desc').where('videos.disabled_at IS NULL')
    end
  end

  def full_length
    length.to_s + ' min'
  end
end
