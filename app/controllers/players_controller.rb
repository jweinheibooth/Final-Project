class PlayersController < ApplicationController
  def index
    matching_players = Player.all

    @list_of_players = matching_players.order({ :created_at => :desc })

    render({ :template => "players/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_players = Player.where({ :id => the_id })

    @the_player = matching_players.at(0)

    render({ :template => "players/show.html.erb" })
  end

  def create
    the_player = Player.new
    the_player.team_id = params.fetch("query_team_id")
    the_player.player_name = params.fetch("query_player_name")
    # the_player.player_stats_count = params.fetch("query_player_stats_count")

    if the_player.valid?
      the_player.save
      redirect_to("/players", { :notice => "Player created successfully." })
    else
      redirect_to("/players", { :notice => "Player failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_player = Player.where({ :id => the_id }).at(0)

    the_player.team_id = params.fetch("query_team_id")
    the_player.player_name = params.fetch("query_player_name")
    # the_player.player_stats_count = params.fetch("query_player_stats_count")

    if the_player.valid?
      the_player.save
      redirect_to("/players/#{the_player.id}", { :notice => "Player updated successfully."} )
    else
      redirect_to("/players/#{the_player.id}", { :alert => "Player failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_player = Player.where({ :id => the_id }).at(0)

    the_player.destroy

    redirect_to("/players", { :notice => "Player deleted successfully."} )
  end
end
