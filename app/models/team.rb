class Team < ActiveRecord::Base
  has_many :fans, :class_name => "User"
  
  def to_s
    self.name
  end
end
