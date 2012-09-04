



task :send_reminder1 => :production do
    puts "Sending advisor reminder email..."
    Message.reminder1
    puts "done."
end


desc "This task is called by the Heroku scheduler add-on"
task :cancel_messages => :production do
    puts "Checking for any messages that need to be cancelled."
    Message.cancel
    puts "done."
end