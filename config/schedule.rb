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

# All jobs are wrapped in this template.
set :job_template, "/bin/zsh -l -c ':job'"

job_type :runner, "cd :path && bundle exec script/rails runner -e :environment ':task' :output"

every :friday, :at => '4:30 am' do
  runner "Video.archive!"
end
