# app/jobs/weekly_job.rb
class WeeklyJob
  include Sidekiq::Worker

  def perform
    # Lógica do job semanal
    Rails.logger.info 'Executing weekly job'
  end
end
