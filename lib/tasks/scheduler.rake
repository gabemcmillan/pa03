


desc "This task calls the method which checks to send reminder emails"
task :send_reminder1 => :production do
    puts "Sending advisor reminder email..."
    Message.reminder1
    puts "done."
end


desc "This task calls the method to check for messages that need to be cancelled"
task :cancel_messages => :production do
    puts "Checking for any messages that need to be cancelled."
    Message.cancel
    puts "done."
end