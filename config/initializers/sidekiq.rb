require 'sidekiq/web'

# Sidekiq::Web.use(Rack::Protection, origin_whitelist: ['https://mysite'])

redis_config = { url: ENV.fetch('SIDEKIQ_REDIS_URL', nil) }

Sidekiq.configure_server do |config|
  config.redis = redis_config
  config.average_scheduled_poll_interval = 1

  config.on(:startup) do
    # Carregar a configuração do sidekiq.yml
    sidekiq_yml = YAML.load_file(Rails.root.join('config/sidekiq.yml'))

    # Criar os cron jobs a partir da configuração
    # if sidekiq_yml['cron_jobs']
    #   sidekiq_yml['cron_jobs'].each do |job|
    #     Sidekiq::Cron::Job.create(
    #       name: job['name'],
    #       cron: job['cron'],
    #       class: job['class']
    #     )
    #   end
    # end
  end

  # schedule_file = "config/schedule.yml"
  # if File.exists?(schedule_file)
  #  Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
  # end
end

Sidekiq.configure_client do |config|
  config.redis = redis_config
end
