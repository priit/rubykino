class AddUserAttributes < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :env, :default => '--- {}'
      t.timestamps
    end
  end
end
