class AddTwitterFieldsToWorkouts < ActiveRecord::Migration
  def self.up
    add_column :workouts, :source, :string
    add_column :workouts, :user_id, :string
  end

  def self.down
    remove_column :workouts, :source
    remove_column :workouts, :user_id
  end
end
