# == Schema Information
#
# Table name: player_stats
#
#  id                   :integer          not null, primary key
#  assists              :string
#  points               :integer
#  rebounds             :integer
#  steals               :string
#  three_point_attempts :integer
#  three_pointers_made  :integer
#  turnovers            :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  game_id              :integer
#  player_id            :integer
#
class PlayerStat < ApplicationRecord

  belongs_to(:player, { :required => true, :class_name => "Player", :foreign_key => "player_id", :counter_cache => true })

  belongs_to(:game, { :required => true, :class_name => "Game", :foreign_key => "game_id" })
  
end
