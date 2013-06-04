class AddWatchedAtToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :watched_at, :datetime
  end
end
