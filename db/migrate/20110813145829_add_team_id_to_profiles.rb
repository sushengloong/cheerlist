class AddTeamIdToProfiles < ActiveRecord::Migration
  def self.up
    add_column :profiles, :team_id, :integer
  end

  def self.down
    remove_column :profiles, :team_id
  end
end
