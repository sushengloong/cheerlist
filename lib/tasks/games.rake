desc "Fetch EPL games from external website"
task :fetch_epl_games => :environment do
  require 'nokogiri'
  require 'open-uri'
  
  url = "http://soccernet.espn.go.com/scores?date=<D>&league=eng.1&cc=4716&xhr=1"

  puts "Fetching EPL games from ESPNsoccernet..."
  sd = Date.parse('2011-08-13')
  ed = Date.parse('2012-05-13')
  
  sd.upto(ed) do |date|
    target = url.sub(/<D>/, date.to_s.delete("-"))
    doc = Nokogiri::HTML(open(target))
    doc.css(".gamebox").each do |gamebox|
      puts "#{gamebox.css(".status").text} - #{gamebox.css(".home a").text} #{gamebox.css(".scores a").text} #{gamebox.css(".away a").text}"
    end
  end
end