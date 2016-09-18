class CreateTravelTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :travel_teams do |t|
      t.string :description
      t.datetime :time_start
      t.datetime :time_return
      t.references :user, foreign_key: true
      t.references :place_review, foreign_key: true

      t.timestamps
    end
  end
end
