class Profile < ActiveRecord::Base
  belongs_to :user
  
  def team
    self.user.team
  end
  
  def team=(team_name)
    team = Team.find_by_name(team_name)
    self.user.team_id = team.id unless team.nil?
    self.user.save!
  end
end