


desc "Task calls the method which checks to send reminder emails"
task :send_reminder1 => :environment do
    puts "Sending advisor reminder email..."
    Message.reminder1
    puts "send_reminder1 done."
end


desc "Task calls the method to check for messages that need to be cancelled"
task :cancel_messages => :environment do 
    puts "Checking for any messages that need to be cancelled."
    Message.cancel
    puts "cancel_messages done."
end