class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :video_id
      t.integer :user_id

      t.timestamps
    end

    add_column :videos, :voutes_count, :integer, :default => 0
  end
end
