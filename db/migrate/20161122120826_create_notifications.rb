class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :target_id
      t.integer :owner_id
      t.integer :key
      t.boolean :seen, default: false
      t.timestamps null: false

      t.references :user, index: true, foreign_key: true
    end
  end
end
