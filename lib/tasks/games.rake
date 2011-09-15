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
      
      puts "#{game_time}: #{home_score} - #{away_score}"
      
      #Game.create! :time => game_time, 
      #  :home_score => home_score, 
      #  :away_score => away_score,
      #  :status => gamebox.css(".status").text, 
      # :home_team_id => nil, 
      # :away_team_id => nil       
      
      # puts "#{gamebox.css(".status").text} - #{gamebox.css(".home a").text} #{gamebox.css(".scores a").text} #{gamebox.css(".away a").text}"
    end
  end
end