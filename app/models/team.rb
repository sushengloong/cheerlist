class Team < ActiveRecord::Base
  has_many :fans, :class_name => "User"
end
