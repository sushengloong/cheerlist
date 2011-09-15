desc "Fetch EPL games from external website"
task :fetch_epl_games => :environment do
  require 'nokogiri'
  require 'open-uri'
  
  url = "http://soccernet.espn.go.com/scores?date=<D>&league=eng.1&cc=4716&xhr=1"

  puts "Fetching EPL games from ESPNsoccernet..."
  sd = Date.parse('2011-08-13')
  #sd = Date.parse('2011-09-17')
  ed = Date.parse('2012-05-13')
  
  sd.upto(ed) do |date|
    target = url.sub(/<D>/, date.to_s.delete("-"))
    doc = Nokogiri::HTML(open(target))
    doc.css(".gamebox").each do |gamebox|
      status = gamebox.css(".status").text.to_s.strip
      hour = 0
      min = 0
      if status.include? ":"
        time_tokens = status.split ":"
        hour = time_tokens[0].to_i
        min = time_tokens[1].to_i
      end
      game_time = DateTime.new(date.year, date.month, date.day, hour, min, 0, 0).to_s
      
      score = gamebox.css(".scores a").text
      home_score = nil
      away_score = nil
      if score.include? "-"
        score_tokens = score.split "-"
        home_score = score_tokens[0].strip.to_i
        away_score = score_tokens[1].strip.to_i
      end
      home_team = Team.find_by_name(gamebox.css(".home a").text.to_s.strip)
      away_team = Team.find_by_name(gamebox.css(".away a").text.to_s.strip)
      home_team_id = home_team.id
      away_team_id = away_team.id
      
      #puts "#{game_time}: #{home_team.name} #{home_score} - #{away_score} #{away_team.name}"
      
      game = Game.create! :time => game_time, 
        :home_score => home_score, 
        :away_score => away_score,
        :status => status, 
        :home_team_id => home_team_id, 
        :away_team_id => away_team_id
      
      puts "#{game.time} (#{game.status}): #{game.home_team.name} #{game.home_score} - #{game.away_score} #{game.away_team.name} [SAVED]"
      # puts "#{gamebox.css(".status").text} - #{gamebox.css(".home a").text} #{gamebox.css(".scores a").text} #{gamebox.css(".away a").text}"
    end
  end
  puts "Task completed!"
end