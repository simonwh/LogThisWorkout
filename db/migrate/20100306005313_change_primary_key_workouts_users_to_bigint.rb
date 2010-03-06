class ChangePrimaryKeyWorkoutsUsersToBigint < ActiveRecord::Migration
  def self.up
    change_column :workouts, :id, :integer, :limit => 8
    change_column :users, :id, :integer, :limit => 8
  end

  def self.down
    change_column :workouts, :id, :integer
    change_column :users, :id, :integer
  end
end
