# frozen_string_literal: true

module Books
  class ServiceBookUpdate < ApplicationService
    
    def initialize(id:, params:)
      @id = id
      #@params = params
      @book_param = params
    end

    def call
      update_book
    end

    private

    def update_book
      result =  BooksRepository.update(@id, @book_param)
      if result[:success]
        notify_user_creation( result[:book] )
        result[:book] 
      else
        result[:errors]
      end
    end


    def notify_user_creation(book)
      ActiveSupport::Notifications.instrument('book.update', book: book)
    end
  end
end
