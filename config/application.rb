require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GraphqlTest
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.api_only = true

    config.active_record.schema_format = :ruby
    config.active_job.queue_adapter = :sidekiq
    # config.debug_exception_response_format = :api

    config.autoload_paths += %W(#{config.root}/app/queries)
    # config.eager_load_paths << "#{Rails.root}/app/queries"

    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
    
  end
end
