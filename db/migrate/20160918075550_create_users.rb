class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end
