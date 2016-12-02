class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.belongs_to :target, :polymorphic => true
      t.belongs_to :owner, :polymorphic => true
      t.integer :key
      t.boolean :seen, default: false
      t.timestamps null: false

      t.references :user, index: true, foreign_key: true
    end
  end
end
