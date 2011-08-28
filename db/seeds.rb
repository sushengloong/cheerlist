# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Populate all EPL teams

epl_teams = {
  "Arsenal" => "Arsenal are the longest residents in the top tier of English football, having been there since 1919. They have won all 27 of their major trophies in that time, including three domestic Doubles. They are also the only team since the 19th century to remain unbeaten throughout an entire top-flight league campaign.",
  "Aston Villa" => "The Premier League era has not always been kind to them but, in terms of major honours won, Aston Villa are the fourth most successful English club, with their 20 trophies placing them behind only Liverpool, Manchester United and Arsenal. They were also the first English side to both do the Double and win the European Cup, and winners of the inaugural League Cup.",
  "Blackburn Rovers" => "Blackburn are best known for their improbable title victory in 1995, the last in England by a provincial club, yet their real golden age came over a century earlier. The club were formed in 1875 during a meeting in the St Leger Hotel. They were founder members of the Football League in 1888, either side of which they won a startling five FA Cups in eight seasons: three in a row from 1884 to 1886 - Blackburn are the last team to achieve the feat - and two more in 1890 and 1891.",
  "Bolton Wanderers" => "Much of Bolton's history been written in the FA Cup. They have won the trophy four times, including the first Wembley final, and took part in the most celebrated FA Cup final of all, when they lost 4-3 to Blackpool in 1953. The Fifties and the Twenties - when they won three FA Cups - are Bolton's most fertile periods, but the present is not far behind: after those two, it is Bolton's longest spell in the top flight.",
  "Chelsea" => "Chelsea are the nouveau superpower of English football. They won 12 major trophies between 1997 and 2010, three times as many as they claimed in the 92 years before that. Most of those successes came after the club was purchased by the Russian billionaire Roman Abramovich in 2003, a move that kickstarted the wave of foreign ownership in the Premier League.",
  "Everton" => "No English side has spent more of its life at the top table than Everton. They have played more matches in the highest division than any other club, and have been outside it for only four years since they were founder members of the Football League in 1888. In that time they have won 15 major honours, including nine league titles.",
  "Fulham" => "Fulham are proof that trophies aren't the be all and end all in football. They are one of the few clubs in the Premier League who have never won a major trophy, yet their story is full of memorable moments, all the way up to their run to the UEFA Cup final in 2010.",
  "Liverpool" => "The story of Liverpool is a unique fusion of triumph and tragedy. They are English football's most successful club with 40 trophies, yet towards the end of their rule of English football came two of the game's biggest disasters at Heysel and Hillsborough. Both the good and bad have shaped the identity of a fiercely proud club. ",
  "Manchester City" => "Manchester City's history can be summed up by one statistic: they are the only English champions to be relegated the following season. It is an apt reflection of a club who have lurched violently between the sublime and the ridiculous, and who have often seemed to have tragicomedy in their genes.",
  "Manchester United" => "Manchester United are an English club in name and a global club in nature. They were the first English side to play in the European Cup and the first side to win it, and they are the only English side to have become world club champions. In addition, the Munich Air Disaster of 1958, which wiped out one of football's great young sides, changed the club indelibly.",
  "Newcastle United" => "Newcastle's infamous, apparently pathological failure to win anything over the last 40 years tends to obscure how prolific they once were. They have won four league championships and six FA Cups, all by 1955, and the Fairs Cup in 1969. They are a club whose achievements have come in clusters, all the way through to them finishing as runners up in the Premier League or FA Cup in four consecutive seasons at the end of the 20th century.",
  "Norwich City" => "Norwich are one of the gentler souls of English football, a family club who most outside Ipswich would struggle to dislike. They have won two League Cups, yet the most celebrated moment in their history is probably the startling victory over Bayern Munich in the UEFA Cup of 1993-94. The club was founded in 1902, during a meeting at the Criterion Cafe. After going into liquidation during the First World War, they reformed in 1919 and joined the Football League for the first time a year later.",
  "Queens Park Rangers" => "Queens Park Rangers have generally reflected the earthy, edgy glamour of their corner of West London, never more so than during the late 1960s and 1970s, when they won the League Cup and very nearly claimed the championship. They were founded in 1882 after a merger between St Jude's and Christchurch Rangers. The fact that so many players came from Queen's Park in North West London was the reason for their name. The club played at 16 different stadiums before eventually settling in the west, at Loftus Road, in 1917.",
  "Stoke City" => "Stoke are the most vintage piece of furniture at English football's top table. They are the oldest club in the Premier League, having been founded in 1863, and the second oldest in all England after Notts County. They have won only one major trophy, the League Cup in 1972, but have spent most of their life in the top two divisions.",
  "Sunderland" => "Sunderland were one of the first powerhouses of the Football League. They won three titles in four years in the 1890s, and two more by 1913. They have won only three major trophies since then: the most of those, in the 1973 FA Cup, is one of English football's most romantic stories.",
  "Swansea City" => "Swansea City are the first Welsh side to play in the English Premier League. They were also the last to play in the old Division One: they spent two years there between 1981 and 1983 as part of an astonishing ascent and descent through the Football League. The club was founded in 1912, and were originally known as Swansea Town. They sensationally beat the English champions, Blackburn, with nine men in the FA Cup of 1914-15, and were founder members of Division Three of the Football League in 1920",
  "Tottenham Hotspur" => "Tottenham Hotspur's position as one of the glory teams of British football was cemented in 1961, when they became the first English team to do the Double in 20th century. That was one of two championships the club has won, but they have added 15 major cups to their collection - including, in 1963, the first European trophy won by an English club.",
  "West Bromwich Albion" => "West Bromwich Albion are one of many English clubs who find nostalgia irresistible. In the 21st century they have become known as a yo-yo club, but before that they had loftier ambitions: between 1886 and 1968, the club reached 10 FA Cup finals, winning five. They were also champions of England for the only time in 1920. ",
  "Wigan Athletic" => "Sporting tales don't come much more unexpected than that of Wigan Athletic, who had to overcome all manner of obstacles to reach the upper echelons of English football. The widespread apathy of a town that puts rugby first, second and third has been a recurring problem, and Wigan also had to deal with a history of failure. They are the fifth football side in the town, with Wigan County, Wigan United, Wigan Town and Wigan Borough all folding.",
  "Wolverhampton Wanderers" => "Wolves are a club that struggles to escape the past. No wonder, when it was so glorious. Between 1949 and 1960, under the management of Stan Cullis, Wolves won two FA Cups and all three of their league championships. That period has defined everything Wolves achieved before or since."
}

epl_teams.each do | name, desc |
  if Team.find_by_name(name).nil?
    Team.create! :name => name, :description => desc, 
      :image_url => "teams/" + name.downcase.gsub(" ", "_") + "_logo.gif"
  end
end

# Create games
games = [
  {:status=>"FT", :time=>DateTime.new(2011, 8, 22), :home_score=>3, :away_score=>0, 
    :home_team=>"Manchester United", :away_team=>"Tottenham Hotspur" },
  {:status=>"FT", :time=>DateTime.new(2011, 8, 27), :home_score=>0, :away_score=>0, 
    :home_team=>"Aston Villa", :away_team=>"Wolverhampton Wanderers" },
  {:status=>"FT", :time=>DateTime.new(2011, 8, 27), :home_score=>2, :away_score=>0, 
    :home_team=>"Wigan Athletic", :away_team=>"Queens Park Rangers" },
  {:status=>"FT", :time=>DateTime.new(2011, 8, 27), :home_score=>0, :away_score=>1, 
    :home_team=>"Blackburn Rovers", :away_team=>"Everton" },
  {:status=>"FT", :time=>DateTime.new(2011, 8, 27), :home_score=>3, :away_score=>1, 
    :home_team=>"Chelsea", :away_team=>"Norwich City" },
  {:status=>"FT", :time=>DateTime.new(2011, 8, 27), :home_score=>0, :away_score=>0, 
    :home_team=>"Swansea City", :away_team=>"Sunderland" },
  {:status=>"FT", :time=>DateTime.new(2011, 8, 27), :home_score=>3, :away_score=>1, 
    :home_team=>"Liverpool", :away_team=>"Bolton Wanderers" },
  {:status=>"14:00 GMT", :time=>DateTime.new(2011, 9, 10, 14, 00), 
    :home_team=>"Arsenal", :away_team=>"Swansea City" },
  {:status=>"14:00 GMT", :time=>DateTime.new(2011, 9, 10, 14, 00), 
    :home_team=>"Everton", :away_team=>"Aston Villa" }
]

games.each do |g|
  Game.create! :status=>g[:status], :time=>g[:time], :home_score=>g[:home_score],
    :away_score=>g[:away_score], :home_team=>Team.find_by_name(g[:home_team]), 
    :away_team=>Team.find_by_name(g[:away_team])
end
