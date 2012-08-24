# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

set :output, "#{path}/log/cron.log"


    every :reboot do
      development:
       script/delayed_job start
       rake "ts:start"
       rake "ts:index"
      production:
       script/delayed_job start
       heroku run rake fs:start
       heroku run rake fs:index
         
    end

    #tasks to execute every 1 hour
    every 1.hours do 
      development:
        rake "ts:reindex"
        rails runner "Message.cancel"
      production:
        heroku run rake fs:reindex
        rails runner "Message.cancel"
    end

    #tasks to execute every 1 day 
    every 1.day, :at => '10:30 pm' do
      development:

      production:
      
    end

    #tasks to execute every 2 minutes
    every 2.minutes do
      development:

      production:
      
    end

    every :sunday, at: "4:28 AM" do
      development:

      production:
      
    end



