class RemoveVideoLenght < ActiveRecord::Migration
  def up
    remove_column :videos, :length
  end

  def down
  end
end
