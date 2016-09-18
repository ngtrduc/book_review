class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :avatar
      t.integer :gender
      t.string :phone
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
