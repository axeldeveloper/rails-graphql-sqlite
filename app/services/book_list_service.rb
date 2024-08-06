
class BookListService < ApplicationService
  
    def call
        author = ::Books::BookByAuthorAndGenre.new(author_id: 1, title: "sample", genre: "Terror" ).call  
        puts author.pluck(:id)
        ::Books::BookList.find_all()
    end

end