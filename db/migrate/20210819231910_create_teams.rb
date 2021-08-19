class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :year
      t.text :description
      t.string :image
      t.integer :players_count
      t.integer :games_count
      t.integer :games_lost_count

      t.timestamps
    end
  end
end
