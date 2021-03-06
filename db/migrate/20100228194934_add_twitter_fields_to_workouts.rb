class AddTwitterFieldsToWorkouts < ActiveRecord::Migration
  def self.up
    add_column :workouts, :source, :string
    add_column :workouts, :user_id, :integer, :limit => 8
  end

  def self.down
    remove_column :workouts, :source
    remove_column :workouts, :user_id
  end
end
