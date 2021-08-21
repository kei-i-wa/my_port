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

# require File.expand_path(File.dirname(__FILE__) + "/environment")
# rails_env = Rails.env.to_sym
env :PATH, ENV['PATH']
set :output, 'log/cron.log'
set :environment, :production
every 1.minutes do
  # every 1.days, at: '0:10 am' do
  runner "Batch::DataReset.data_reset"
end

# every 1.days, at: '0:10 am' do
every 1.minutes do
  runner "Batch::DataReset.data_notice"
end
