class CreateCheckIns < ActiveRecord::Migration
  def self.up
    create_table :check_ins do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end

  def self.down
    drop_table :check_ins
  end
end
