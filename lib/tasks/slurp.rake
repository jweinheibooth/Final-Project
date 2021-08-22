namespace :slurp do
  desc "TODO"
  task players: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "players.csv"), encoding: 'bom|utf-8')
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      p = Player.new
      p.team_id = row["teamid"]
      p.player_name = row["playername"]
      p.save
      puts "#{p.team_id}, #{p.player_name} saved"
      p p.errors.full_messages
    end

    puts "There are now #{Player.count} rows in the players table"
  end

  task games: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "games.csv"), encoding: 'bom|utf-8')
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      g = Game.new
      g.winner_id = row["winnerid"]
      g.loser_id = row["loserid"]
      g.winner_points = row["winnerpoints"]
      g.loser_points = row["loserpoints"]
      g.save
      puts "#{g.winner_id}, #{g.loser_id}, #{g.winner_points}, #{g.loser_points} saved"
      p g.errors.full_messages
    end

    puts "There are now #{Game.count} rows in the games table"
  end

  task stats: :environment do

    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "stats.csv"), encoding: 'bom|utf-8')
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      s = PlayerStat.new
      s.assists = row["Assists"]
      s.points = row["points"]
      s.rebounds = row["Rebounds"]
      s.steals = row["steals"]
      s.three_point_attempts = row["3PA"]
      s.three_pointers_made = row["3PM"]
      s.turnovers = row["turnovers"] 
      s.game_id = row["game_id"]
      s.player_id = row["player_id"]
      s.save
      puts "#{s.assists}, #{s.points}, #{s.rebounds}, #{s.steals}, #{s.three_point_attempts}, #{s.three_pointers_made}, #{s.turnovers}, #{s.game_id}, #{s.player_id} saved"
      p s.errors.full_messages
    end

    puts "There are now #{PlayerStat.count} rows in the playerstats table"
  end

end
