# frozen_string_literal: true

# Exemplo de uso:
#
#   Books::ServiceBookOne.new(2).call
#   
#
module Books
  class ServiceBookOne < ApplicationService
    
    def initialize(id)
      @book_id = id
    end

    def call
      Rails.logger.info("Fetching book with ID: #{ @book_id }")
      BooksRepository.find_by_id(@book_id)
    end
  end
end
