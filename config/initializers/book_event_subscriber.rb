# config/initializers/book_event_subscriber.rb
ActiveSupport::Notifications.subscribe('book.created') do |name, start, finish, id, payload|
    # Aqui você pode adicionar lógica adicional, como enviar e-mails
    # job = Sidekiq::Cron::Job.create(name: 'Hard worker - every 1min', cron: '1 * * * *', queue: 'default', class: 'HardWorker' )
    book = payload[:book]
    message = "Book created with ID: => #{book.id}"
    Rails.logger.info message
    
    # Enfileira o trabalho do Sidekiq para registrar o auditamento
    AuditWorker.perform_async(book.id, message)
    StartCronWorker.perform_async()
end
  


ActiveSupport::Notifications.subscribe('book.update') do |name, start, finish, id, payload|
    # Audit.create_audit_for(payload[:book], "Book update with ID: => #{payload[:book].id}")
    book = payload[:book]
    message = "Book update with ID: => #{book.id}"
    Rails.logger.info message

    # Enfileira o trabalho do Sidekiq para registrar o auditamento
    AuditWorker.perform_async(book.id, message)
    
    # Enfileira o job para ser executado 10 segundos após a criação do livro
    DelayedJobWorker.perform_in(20.seconds, book.id)

end