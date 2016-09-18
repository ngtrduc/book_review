class CreateUserTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :user_teams do |t|
      t.references :user, foreign_key: true
      t.references :travel_team, foreign_key: true

      t.timestamps
    end
  end
end
