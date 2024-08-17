# frozen_string_literal: true

module Books
  class ServiceBookRegistration < ApplicationService
    def initialize(user_params)
      @user_params = user_params
    end

    def call
      create_book
    end

    private

    def create_book
      # book = ::Books::BookListQuery.create(@user_params)
      book = Book.new(@user_params)
      if book.save
        notify_user_creation(book)
        book
      else
        book.errors
      end
    end

    def notify_user_creation(book)
      ActiveSupport::Notifications.instrument('book.created', book: book)
    end
  end
end
