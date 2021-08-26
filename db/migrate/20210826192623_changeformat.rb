class Changeformat < ActiveRecord::Migration[6.0]
  def change
    change_column :player_stats, :steals, :integer
    change_column :player_stats, :assists, :integer
    change_column :player_stats, :turnovers, :integer
  end
end
