class CreateSuggestions < ActiveRecord::Migration[5.0]
  def change
    create_table :suggestions do |t|
      t.string :tittle
      t.string :description
      t.string :image
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
