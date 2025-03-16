require "active_support/core_ext/integer/time"

Rails.application.configure do
# Settings specified here will take precedence over those in config/application.rb.

  config.active_record.sqlite3_production_warning=false
    

  # Code is not reloaded between requests.
  config.enable_reloading = false
  config.eager_load = true
  config.autoloader = :classic
  config.hosts << "rails-graphql-sqlite.fly.dev"
  config.consider_all_requests_local = false
  config.force_ssl = true

  # Log to STDOUT by default
  config.logger = ActiveSupport::Logger.new(STDOUT)
    .tap  { |logger| logger.formatter = ::Logger::Formatter.new }
    .then { |logger| ActiveSupport::TaggedLogging.new(logger) }

  # Prepend all log lines with the following tags.
  config.log_tags = [ :request_id ]

  config.log_level = ENV.fetch("RAILS_LOG_LEVEL", "info")
  config.action_mailer.perform_caching = false
  config.i18n.fallbacks = true

  # Don't log any deprecations.
  config.active_support.report_deprecations = false

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false


end
