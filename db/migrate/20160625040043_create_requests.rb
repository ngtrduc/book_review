class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :content
      t.integer :status, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
