# app/workers/audit_worker.rb
class AuditWorker
  include Sidekiq::Worker

  def perform(book_id, message)
    # book = Book.find(book_id)
    book = ::Books::BookListQuery.find_by_id(book_id)
    if book
      Audit.create_audit_for(book, message)
    else
      Rails.logger.error "Book with ID #{book_data['id']} not found."
    end
  end

end