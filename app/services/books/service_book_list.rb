# frozen_string_literal: true

# Exemplo de uso:
#
#   service = ServiceBookUpdate.new(book, params)
#   service.call
#
module Books
  class ServiceBookList < ApplicationService
    def call
      ::Books::BookListQuery.find_all
    end
  end
end
