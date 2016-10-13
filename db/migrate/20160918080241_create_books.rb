class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :tittle
      t.string :description
      t.string :author
      t.float :rate_score
      t.datetime :publish
      t.integer :number_of_pages
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
