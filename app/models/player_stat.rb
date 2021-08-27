# == Schema Information
#
# Table name: player_stats
#
#  id                   :integer          not null, primary key
#  assists              :integer
#  points               :integer
#  rebounds             :integer
#  steals               :integer
#  three_point_attempts :integer
#  three_pointers_made  :integer
#  turnovers            :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  game_id              :integer
#  player_id            :integer
#
class PlayerStat < ApplicationRecord

  belongs_to(:player, { :required => true, :class_name => "Player", :foreign_key => "player_id", :counter_cache => true })

  belongs_to(:game, { :required => true, :class_name => "Game", :foreign_key => "game_id" })
  
  # def ppg
  #   point_array = self.pluck(:points)
  #   game_count = point_array.count
  #   total_points = point_array.sum
  #   if game_count > 0
  #   return total_points / game_count
  #   else 0
  #   end
  # end

  def opponent
    team = self.player.team
    if team == self.game.winner
    return self.game.loser.team_name
    else 
      return self.game.winner.team_name
    end
  end
  
end

