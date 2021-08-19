class PlayerStatsController < ApplicationController
  def index
    matching_player_stats = PlayerStat.all

    @list_of_player_stats = matching_player_stats.order({ :created_at => :desc })

    render({ :template => "player_stats/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_player_stats = PlayerStat.where({ :id => the_id })

    @the_player_stat = matching_player_stats.at(0)

    render({ :template => "player_stats/show.html.erb" })
  end

  def create
    the_player_stat = PlayerStat.new
    the_player_stat.points = params.fetch("query_points")
    the_player_stat.three_pointers_made = params.fetch("query_three_pointers_made")
    the_player_stat.three_point_attempts = params.fetch("query_three_point_attempts")
    the_player_stat.rebounds = params.fetch("query_rebounds")
    the_player_stat.assists = params.fetch("query_assists")
    the_player_stat.turnovers = params.fetch("query_turnovers")
    the_player_stat.steals = params.fetch("query_steals")
    the_player_stat.game_id = params.fetch("query_game_id")
    the_player_stat.player_id = params.fetch("query_player_id")

    if the_player_stat.valid?
      the_player_stat.save
      redirect_to("/player_stats", { :notice => "Player stat created successfully." })
    else
      redirect_to("/player_stats", { :notice => "Player stat failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_player_stat = PlayerStat.where({ :id => the_id }).at(0)

    the_player_stat.points = params.fetch("query_points")
    the_player_stat.three_pointers_made = params.fetch("query_three_pointers_made")
    the_player_stat.three_point_attempts = params.fetch("query_three_point_attempts")
    the_player_stat.rebounds = params.fetch("query_rebounds")
    the_player_stat.assists = params.fetch("query_assists")
    the_player_stat.turnovers = params.fetch("query_turnovers")
    the_player_stat.steals = params.fetch("query_steals")
    the_player_stat.game_id = params.fetch("query_game_id")
    the_player_stat.player_id = params.fetch("query_player_id")

    if the_player_stat.valid?
      the_player_stat.save
      redirect_to("/player_stats/#{the_player_stat.id}", { :notice => "Player stat updated successfully."} )
    else
      redirect_to("/player_stats/#{the_player_stat.id}", { :alert => "Player stat failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_player_stat = PlayerStat.where({ :id => the_id }).at(0)

    the_player_stat.destroy

    redirect_to("/player_stats", { :notice => "Player stat deleted successfully."} )
  end
end
