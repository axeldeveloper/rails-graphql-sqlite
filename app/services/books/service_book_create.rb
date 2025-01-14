# frozen_string_literal: true

module Books
  class ServiceBookCreate < ApplicationService
    
    def initialize(book_param)
      @book_param = book_param
    end

    def call
      create_book
    end

    private

    def create_book
      result =  BooksRepository.create(@book_param)
      if result[:success]
        notify_user_creation( result[:book] )
        result[:book] 
      else
        result[:errors]
      end
    end

  
    def notify_user_creation(book)
      ActiveSupport::Notifications.instrument('book.created', book: book)
    end
  end
end
