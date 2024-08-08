require 'sidekiq/web'

# Sidekiq::Web.use(Rack::Protection, origin_whitelist: ['https://mysite'])

redis_config = { url: ENV['SIDEKIQ_REDIS_URL'] }

Sidekiq.configure_server do |config|
    config.redis = redis_config
    config.average_scheduled_poll_interval = 1

    #config.periodic do |mgr|
    #    puts "worker pedioc"
        # mgr.register('* 2 * * *', 'GenerateRandomUserJob') # 2am daily
    #    mgr.register('1 * * * *', 'GenerateRandomUserJob') # 2am daily
    #end


    #schedule_file = "config/schedule.yml"
    #if File.exists?(schedule_file)
    #  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
    #end
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
