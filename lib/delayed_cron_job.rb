require 'delayed_job'
require 'english'
require 'delayed_cron_job/cronline'
require 'delayed_cron_job/plugin'
require 'delayed_cron_job/version'
require 'delayed_cron_job/backend/updatable_cron'
require 'delayed_job_active_record'

module DelayedCronJob; end

Delayed::Backend::ActiveRecord::Job.send(
  :include,
  DelayedCronJob::Backend::UpdatableCron
)

class Delayed::Backend::ActiveRecord::Job
  attr_accessor :cron
end

Delayed::Worker.plugins << DelayedCronJob::Plugin

require 'delayed_cron_job/active_job/enqueuing'
require 'delayed_cron_job/active_job/queue_adapter'

ActiveJob::Base.send(:include, DelayedCronJob::ActiveJob::Enqueuing)

ActiveJob::QueueAdapters::DelayedJobAdapter.extend(
  DelayedCronJob::ActiveJob::QueueAdapter
)
