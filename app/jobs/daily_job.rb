class DailyJob
  include Sidekiq::Worker

  def perform
    # Lógica do job diário
    Rails.logger.info 'Executing daily job'
  end
end