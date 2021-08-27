# == Schema Information
#
# Table name: games
#
#  id            :integer          not null, primary key
#  loser_points  :integer
#  winner_points :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  loser_id      :integer
#  winner_id     :integer
#
class Game < ApplicationRecord

  belongs_to(:winner, { :required => true, :class_name => "Team", :foreign_key => "winner_id", :counter_cache => true })

  belongs_to(:loser, { :required => true, :class_name => "Team", :foreign_key => "loser_id", :counter_cache => :games_lost_count })

  has_many(:player_stats, { :class_name => "PlayerStat", :foreign_key => "game_id", :dependent => :destroy })

  has_many(:players, { :through => :player_stats, :source => :player })
end
