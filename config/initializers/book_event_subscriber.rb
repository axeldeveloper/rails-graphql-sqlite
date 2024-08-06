# config/initializers/book_event_subscriber.rb
ActiveSupport::Notifications.subscribe('book.created') do |name, start, finish, id, payload|
    Rails.logger.info "Book created with ID: #{payload[:book].id}"
    # Aqui você pode adicionar lógica adicional, como enviar e-mails
end
  