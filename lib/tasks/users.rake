desc "Create devise users"
task :create_users => :environment do
  
  user = User.new(:email => "rubyhacker@gmail.com", :password => "rubyhacker")
  user.confirm!
  user.create_profile :first_name => "Ruby", 
      :last_name => "Hacker", :points => 1000,
      :image_url => "demo_users/ruby_hacker.jpg"
  if user.save!
    puts "User with email '#{user.email}' [SAVED]"
  else
    puts "User with email '#{user.email}' creation failed!"
  end

  user = User.new(:email => "waynerooney@gmail.com", :password => "waynerooney")
  user.confirm!
  user.create_profile :first_name => "Wayne", 
      :last_name => "Rooney", :points => 800,
      :image_url => "demo_users/wayne_rooney.jpg"
  if user.save!
    puts "User with email '#{user.email}' [SAVED]"
  else
    puts "User with email '#{user.email}' creation failed!"
  end
  
  user = User.new(:email => "jasonleezzzzz@hotmail.com", :password => "jasonleezzzzz")
  user.confirm!
  user.create_profile :first_name => "Jason", 
      :last_name => "Lee", :points => 2011,
      :image_url => "demo_users/jason_lee.jpg"
  if user.save!
    puts "User with email '#{user.email}' [SAVED]"
  else
    puts "User with email '#{user.email}' creation failed!"
  end

  user = User.new(:email => "sushengloong@gmail.com", :password => "sushengloong")
  user.confirm!
  user.create_profile :first_name => "Sheng Loong", 
      :last_name => "Su", :points => 2011,
      :image_url => "demo_users/shengloong_su.jpg"
  if user.save!
    puts "User with email '#{user.email}' [SAVED]"
  else
    puts "User with email '#{user.email}' creation failed!"
  end

  puts "Rake task 'create_users' completed!"
end