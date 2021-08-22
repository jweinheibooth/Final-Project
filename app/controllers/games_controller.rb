class GamesController < ApplicationController
  def index
    matching_games = Game.all

    @list_of_games = matching_games.order({ :game_id => :asc })

    render({ :template => "games/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_games = Game.where({ :id => the_id })

    @the_game = matching_games.at(0)

    render({ :template => "games/show.html.erb" })
  end

  def create
    the_game = Game.new
    the_game.winner_id = params.fetch("query_winner_id")
    the_game.loser_id = params.fetch("query_loser_id")
    the_game.winner_points = params.fetch("query_winner_points")
    the_game.loser_points = params.fetch("query_loser_points")

    if the_game.valid?
      the_game.save
      redirect_to("/games", { :notice => "Game created successfully." })
    else
      redirect_to("/games", { :notice => "Game failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_game = Game.where({ :id => the_id }).at(0)

    the_game.winner_id = params.fetch("query_winner_id")
    the_game.loser_id = params.fetch("query_loser_id")
    the_game.winner_points = params.fetch("query_winner_points")
    the_game.loser_points = params.fetch("query_loser_points")

    if the_game.valid?
      the_game.save
      redirect_to("/games/#{the_game.id}", { :notice => "Game updated successfully."} )
    else
      redirect_to("/games/#{the_game.id}", { :alert => "Game failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_game = Game.where({ :id => the_id }).at(0)

    the_game.destroy

    redirect_to("/games", { :notice => "Game deleted successfully."} )
  end
end
