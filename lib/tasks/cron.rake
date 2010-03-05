task :cron => :environment do
 if Time.now.hour % 1 == 0 # run every hour
   puts "Fetching new workouts, updating database and sending reply tweets. Phew..."
   Workout.fetch_and_update_db
   puts "Done"
 end
end
