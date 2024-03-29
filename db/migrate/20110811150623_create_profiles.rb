class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.integer :points, :default => 0
      t.string :image_url
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
