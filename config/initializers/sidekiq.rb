Sidekiq.configure_server do |config|
  config.death_handlers << ->(job, ex) do
    SendAfterErrorMailer.death_user.deliver_later
  end
end

schedule_file = "config/schedule.yml"

if File.exist?(schedule_file) && Sidekiq.server?
  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
end
