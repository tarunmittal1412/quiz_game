$LOAD_PATH << '.'
require 'entities/player.rb'
class Scores 

  def save_score(player, quiz_category)
    CSV.open("csv_files/high_score.csv", "a+") do |csv|
      csv << [player.name, player.score, quiz_category]
    end
  end

  def get_scores(n)
    players = []
    CSV.foreach('csv_files/high_score.csv') do |row|
      if ((row[0] != nil) && (row[1] != nil))
        players.push(Player.new(row[0],row[1]))
      end 
    end

    sorted_players = []
      sorted_players = players.sort_by {|player| player.score}.reverse
         
    i = 0
    sorted_players.each do |player|
      i+= 1
      if i > n
        break 
      end
      puts "name = #{player.name}, score = #{player.score}" 
    end
  end
end 
