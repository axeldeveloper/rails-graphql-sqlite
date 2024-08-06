module Books
 class BookByAuthorAndGenre
    def initialize(author_id:, title:, genre:)
      @author_id = author_id
      @title = title
      @genre = genre
    end
  
    def call
      scope = Book.where(author_id: @author_id)
      scope = filter_by_genre(scope)
      scope.order(:title)
    end
  
    
    private def filter_by_genre(scope)
      scope.where('genre >= ? ', @genre)
    end

  end
end