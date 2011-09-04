class AddLocationIdToCheckIn < ActiveRecord::Migration
  def self.up
    add_column :check_ins, :location_id, :integer
  end

  def self.down
    remove_column :check_ins, :location_id
  end
end
