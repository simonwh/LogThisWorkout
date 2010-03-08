class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.recent({:hours => 100, :limit => 20})
  end
  
  def show
    @workout = Workout.find(params[:id])
  end
  
  def destroy
    @workout = Workout.find(params[:id])
    @workout.destroy
    redirect_to root_path
  end
end
