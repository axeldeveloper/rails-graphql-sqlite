class StartCronWorker
  include Sidekiq::Worker
  # queue_as :default

  def perform(*args)
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts " StartCronWorker  in 2 second"
    sleep 2

      job = Sidekiq::Cron::Job.new(name: 'Hard worker - every 5min', cron: '*/5 * * * *', class: 'HardWorker')
      if job.valid?
          job.save
      else
          puts job.errors
      end
    
    Rails.logger.info "Book created with ID: #{job}"
  end

end