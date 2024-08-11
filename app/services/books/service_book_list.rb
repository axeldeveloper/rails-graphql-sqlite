module Books
  class ServiceBookList < ApplicationService
    def call
      ::Books::BookListQuery.find_all
    end
  end
end
