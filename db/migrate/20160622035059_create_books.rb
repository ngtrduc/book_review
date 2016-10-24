class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.date :publish_date
      t.string :author
      t.string :number_page
      t.float :rate_avg, defaulf: 0
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
