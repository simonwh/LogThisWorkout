class ChangeTwitterIdToIdOnWorkouts < ActiveRecord::Migration
  def self.up
    remove_column :workouts, :twitter_id
  end

  def self.down
    add_column :workouts, :twitter_id, :integer
  end
end
