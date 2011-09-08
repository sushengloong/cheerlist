class AddNameToCheckIn < ActiveRecord::Migration
  def self.up
    add_column :check_ins, :name, :string
  end

  def self.down
    remove_column :check_ins, :name
  end
end
