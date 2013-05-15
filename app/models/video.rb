class Video < ActiveRecord::Base
  attr_accessible :length, :title, :url, :user_id

  validates :title, :url, :presence => true

  def full_length
    length.to_s + ' min'
  end
end
