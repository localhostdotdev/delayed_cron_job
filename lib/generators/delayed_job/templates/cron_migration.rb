class AddCronToDelayedJobs < ActiveRecord::Migration<%= migration_version %>
  def change
    add_column :delayed_jobs, :cron, :string
  end
end
