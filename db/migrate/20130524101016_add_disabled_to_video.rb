class AddDisabledToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :disabled_at, :datetime
  end
end
