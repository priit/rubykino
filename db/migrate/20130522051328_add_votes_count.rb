class AddVotesCount < ActiveRecord::Migration
  def change
    add_column :videos, :votes_count, :integer, :default => 0
  end
end
