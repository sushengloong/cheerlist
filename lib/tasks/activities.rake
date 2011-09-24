desc "Create activities - check-ins, comments, etc"
task :create_activities => :environment do
  
  singapore = Country.find_by_name "Singapore"
  malaysia = Country.find_by_name "Malaysia"
  
  check_in = CheckIn.new :user_id => 1, :game_id => 50
  if check_in.create_location(:name => "NCS Hub", :address => "5 Ang Mo Kio",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.3876006102770881, :longitude => 103.84417193506465)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 2, :game_id => 50
  if check_in.create_location(:name => "888 Plaza", :address => "888 Plaza Woodlands",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.4375388888162062, :longitude => 103.79533427332149)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  comment = Comment.build_from(Game.find_by_id(50), 1, "Man Utd is so awesome!")
  if comment.save!
    puts "Comment '#{comment.body}' [SAVED]"
  else
    puts "Comment '#{comment.body}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 3, :game_id => 50
  if check_in.create_location(:name => "Sheng Loong's House", :address => "40 Jalan Undan 2 Taman Perling",
    :city => "Johor Bahru", :country_id => malaysia.id, 
    :latitude => 1.4862373117656564, :longitude => 103.68400114153133)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 4, :game_id => 30
  if check_in.create_location(:name => "Ah Lee's House", :address => "59 Jalan Selamat, Kembangan",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.3259110124825912, :longitude => 103.91512709234462)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 1, :game_id => 30
  if check_in.create_location(:name => "NCS Hub", :address => "5 Ang Mo Kio",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.3876006102770881, :longitude => 103.84417193506465)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  comment = Comment.build_from(Game.find_by_id(50), 3, "Man Utd rocks!")
  if comment.save!
    puts "Comment '#{comment.body}' [SAVED]"
  else
    puts "Comment '#{comment.body}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 4, :game_id => 50
  if check_in.create_location(:name => "Ah Lee's House", :address => "59 Jalan Selamat, Kembangan",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.3259110124825912, :longitude => 103.91512709234462)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 2, :game_id => 79
  if check_in.create_location(:name => "888 Plaza", :address => "888 Plaza Woodlands",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.4375388888162062, :longitude => 103.79533427332149)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  comment = Comment.build_from(Game.find_by_id(79), 4, "Proud to be a Man Utd fan!")
  if comment.save!
    puts "Comment '#{comment.body}' [SAVED]"
  else
    puts "Comment '#{comment.body}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 4, :game_id => 79
  if check_in.create_location(:name => "Ah Lee's House", :address => "59 Jalan Selamat, Kembangan",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.3259110124825912, :longitude => 103.91512709234462)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 1, :game_id => 79
  if check_in.create_location(:name => "NCS Hub", :address => "5 Ang Mo Kio",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.3876006102770881, :longitude => 103.84417193506465)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  check_in = CheckIn.new :user_id => 3, :game_id => 79
  if check_in.create_location(:name => "888 Plaza", :address => "888 Plaza Woodlands",
    :city => "Singapore", :country_id => singapore.id, 
    :latitude => 1.4375388888162062, :longitude => 103.79533427332149)
    if check_in.save!
      puts "Check-in at location '#{check_in.location.name}' [SAVED]"
    else
      puts "Check-in with location '#{check_in.location.name}' creation failed!"
    end
  else
    puts "Location '#{check_in.location.name}' creation failed!"
  end
  
  comment = Comment.build_from(Game.find_by_id(79), 2, "Cool match!")
  if comment.save!
    puts "Comment '#{comment.body}' [SAVED]"
  else
    puts "Comment '#{comment.body}' creation failed!"
  end
  
  puts "Rake task 'create_activities' completed!"
end