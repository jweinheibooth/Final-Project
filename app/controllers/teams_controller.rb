class TeamsController < ApplicationController
  def index
    matching_teams = Team.all

    @list_of_teams = matching_teams.order({ :games_count => :desc })

    render({ :template => "teams/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_teams = Team.where({ :id => the_id })

    roster = Player.where({ :team_id => the_id})

    @the_team = matching_teams.at(0)

    roster = Player.where({ :team_id => the_id})

    @the_roster = roster

    render({ :template => "teams/show.html.erb" })
  end

  def create
    the_team = Team.new
    the_team.team_name = params.fetch("query_team_name")
    the_team.year = params.fetch("query_year")
    the_team.description = params.fetch("query_description")
    the_team.image = params.fetch("query_image")
    the_team.players_count = params.fetch("query_players_count")
    the_team.games_count = params.fetch("query_games_count")
    the_team.games_lost_count = params.fetch("query_games_lost_count")

    if the_team.valid?
      the_team.save
      redirect_to("/teams", { :notice => "Team created successfully." })
    else
      redirect_to("/teams", { :notice => "Team failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_team = Team.where({ :id => the_id }).at(0)

    the_team.team_name = params.fetch("query_team_name")
    the_team.year = params.fetch("query_year")
    the_team.description = params.fetch("query_description")
    the_team.image = params.fetch("query_image")
    the_team.players_count = params.fetch("query_players_count")
    the_team.games_count = params.fetch("query_games_count")
    the_team.games_lost_count = params.fetch("query_games_lost_count")

    if the_team.valid?
      the_team.save
      redirect_to("/teams/#{the_team.id}", { :notice => "Team updated successfully."} )
    else
      redirect_to("/teams/#{the_team.id}", { :alert => "Team failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_team = Team.where({ :id => the_id }).at(0)

    the_team.destroy

    redirect_to("/teams", { :notice => "Team deleted successfully."} )
  end


end
