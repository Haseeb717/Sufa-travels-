desc "This task is called by the Heroku scheduler add-on"
task :update_balance => :environment do
  puts "Updating feed..."
  DailyBalance.update_balance
  puts "done."
end