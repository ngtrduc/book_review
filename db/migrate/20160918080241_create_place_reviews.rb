class CreatePlaceReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :place_reviews do |t|
      t.string :tittle
      t.string :description
      t.string :image
      t.float :rate
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
