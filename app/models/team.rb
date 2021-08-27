# == Schema Information
#
# Table name: teams
#
#  id               :integer          not null, primary key
#  description      :text
#  games_count      :integer
#  games_lost_count :integer
#  image            :string
#  players_count    :integer
#  team_name        :string
#  year             :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Team < ApplicationRecord

  validates(:team_name, { :presence => true })
  
  has_many(:players, { :class_name => "Player", :foreign_key => "team_id", :dependent => :destroy })

  has_many(:games, { :class_name => "Game", :foreign_key => "winner_id", :dependent => :destroy })

  has_many(:games_lost, { :class_name => "Game", :foreign_key => "loser_id", :dependent => :destroy })

  has_many(:player_stats, { :through => :players, :source => :player_stats })
end
