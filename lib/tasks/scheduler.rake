



task :send_reminder1 => :environment do
    puts "Sending reminder of 1 day left for message..."
    Message.reminder1
    puts "done."
end


desc "This task is called by the Heroku scheduler add-on"
task :cancel_messages => :environment do
    puts "Checking messages needing cancelled..."
    Message.cancel
    puts "done."
end