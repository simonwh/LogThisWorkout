module ApplicationHelper
  def calender_item_class(user, day)
    workout_dates = user.workouts.collect {|x| x.created_at.to_date }
    if workout_dates.include?(day)
      return "yes"
    else
      return "no"
    end
  end
end
