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
      puts "#{p.team_id}, #{p.player_name} saved"
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
      puts "#{g.winner_id}, #{g.loser_id}, #{g.winner_points}, #{g.loser_points} saved"
    end

    puts "There are now #{Game.count} rows in the games table"
  end

end
