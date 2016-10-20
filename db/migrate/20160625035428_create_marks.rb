class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.integer :status
      t.boolean :favorite
      t.references :user, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
