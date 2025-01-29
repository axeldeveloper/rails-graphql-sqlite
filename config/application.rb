require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GraphqlTest
  class Application < Rails::Application
    Rails.autoloaders.log!
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.active_record.verify_foreign_keys_for_fixtures = false
    config.active_support.cache_format_version = 7.1

    config.autoload_lib(ignore: %w(assets tasks))

    config.api_only = true
    config.active_record.schema_format = :ruby
    config.active_job.queue_adapter = :sidekiq
    config.assets.initialize_on_precompile = true


    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end
end
