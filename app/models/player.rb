# == Schema Information
#
# Table name: players
#
#  id                 :integer          not null, primary key
#  player_name        :string
#  player_stats_count :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  team_id            :integer
#
class Player < ApplicationRecord

  validates(:team_id, { :presence => true })

  validates(:player_name, { :presence => true })
  
  belongs_to(:team, { :required => true, :class_name => "Team", :foreign_key => "team_id", :counter_cache => true })

  has_many(:player_stats, { :class_name => "PlayerStat", :foreign_key => "player_id", :dependent => :destroy })

  has_many(:games, { :through => :player_stats, :source => :game })

  def ppg
    point_array = self.player_stats.pluck(:points)
    game_count = point_array.count
    total_points = point_array.sum
    points = total_points / game_count
    return points.to_f
  end

end
