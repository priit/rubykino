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

    def archive!
      @last_date = Meetup.last_date
      @next_date = Meetup.next_date

      where('videos.watched_at IS NULL').each do |v|
        next if (@last_date..@next_date).include? v.created_at
        v.watched_at = @last_date
        v.save
      end
    end
  end
end
