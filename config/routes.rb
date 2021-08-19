Rails.application.routes.draw do

  get("/", { :controller => "teams", :action => "index" })

  # Routes for the Player stat resource:

  # CREATE
  post("/insert_player_stat", { :controller => "player_stats", :action => "create" })
          
  # READ
  get("/player_stats", { :controller => "player_stats", :action => "index" })
  
  get("/player_stats/:path_id", { :controller => "player_stats", :action => "show" })
  
  # UPDATE
  
  post("/modify_player_stat/:path_id", { :controller => "player_stats", :action => "update" })
  
  # DELETE
  get("/delete_player_stat/:path_id", { :controller => "player_stats", :action => "destroy" })

  #------------------------------

  # Routes for the Game resource:

  # CREATE
  post("/insert_game", { :controller => "games", :action => "create" })
          
  # READ
  get("/games", { :controller => "games", :action => "index" })
  
  get("/games/:path_id", { :controller => "games", :action => "show" })
  
  # UPDATE
  
  post("/modify_game/:path_id", { :controller => "games", :action => "update" })
  
  # DELETE
  get("/delete_game/:path_id", { :controller => "games", :action => "destroy" })

  #------------------------------

  # Routes for the Player resource:

  # CREATE
  post("/insert_player", { :controller => "players", :action => "create" })
          
  # READ
  get("/players", { :controller => "players", :action => "index" })
  
  get("/players/:path_id", { :controller => "players", :action => "show" })
  
  # UPDATE
  
  post("/modify_player/:path_id", { :controller => "players", :action => "update" })
  
  # DELETE
  get("/delete_player/:path_id", { :controller => "players", :action => "destroy" })

  #------------------------------

  # Routes for the Team resource:

  # CREATE
  post("/insert_team", { :controller => "teams", :action => "create" })
          
  # READ
  get("/teams", { :controller => "teams", :action => "index" })
  
  get("/teams/:path_id", { :controller => "teams", :action => "show" })
  
  # UPDATE
  
  post("/modify_team/:path_id", { :controller => "teams", :action => "update" })
  
  # DELETE
  get("/delete_team/:path_id", { :controller => "teams", :action => "destroy" })

  #------------------------------

end
