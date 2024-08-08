# config/initializers/book_event_subscriber.rb
ActiveSupport::Notifications.subscribe('book.created') do |name, start, finish, id, payload|
    Rails.logger.info "Book created with ID: => #{payload[:book].id}"
    # Aqui você pode adicionar lógica adicional, como enviar e-mails

    #job = Sidekiq::Cron::Job.create(
    #    name: 'Hard worker - every 1min',
    #    cron: '1 * * * *',
    #    queue: 'default',
    #    class: 'HardWorker'
    #)

    job = Sidekiq::Cron::Job.new(name: 'Hard worker - every 5min', cron: '*/5 * * * *', class: 'HardWorker')
    if job.valid?
        job.save
    else
        puts job.errors
    end
    

    Rails.logger.info "Book created with ID: #{job}"
end
  