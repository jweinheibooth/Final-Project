class CreatePlayerStats < ActiveRecord::Migration[6.0]
  def change
    create_table :player_stats do |t|
      t.integer :points
      t.integer :three_pointers_made
      t.integer :three_point_attempts
      t.integer :rebounds
      t.string :assists
      t.string :turnovers
      t.string :steals
      t.integer :game_id
      t.integer :player_id

      t.timestamps
    end
  end
end
