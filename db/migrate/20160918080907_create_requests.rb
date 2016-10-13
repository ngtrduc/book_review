class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
      t.string :description
      t.string :tittle
      t.string :author
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
