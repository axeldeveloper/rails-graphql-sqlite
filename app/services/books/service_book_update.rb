module Books
  class ServiceBookUpdate < ApplicationService
    def initialize(id:, params:)
      @id = id
      @params = params
    end

    def call
      update_book
    end

    private def update_book
      book = ::Books::BookListQuery.find_by_id(@id)
      if book.update(@params)
        notify_user_creation(book)
        book
      else
        book.errors
      end
    end

    private def notify_user_creation(book)
      ActiveSupport::Notifications.instrument('book.update', book: book)
    end
  end
end
