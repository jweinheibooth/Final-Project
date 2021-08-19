class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.integer :team_id
      t.string :player_name
      t.integer :player_stats_count

      t.timestamps
    end
  end
end
