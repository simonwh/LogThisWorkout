class CreateWorkouts < ActiveRecord::Migration
  def self.up
    create_table :workouts do |t|
      t.text :message
      t.integer :twitter_id
      t.timestamps
    end
  end

  def self.down
    drop_table :workouts
  end
end
