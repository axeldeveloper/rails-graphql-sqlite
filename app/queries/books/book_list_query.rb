# app/queries/Book/book_list.rb
module Books
  class BookListQuery

    def self.find_all
      Book.all()
    end

    def self.find_limit(limit)
      Book.all().top(limit)
    end
  
    def self.find_by_id(id)
      Book.find_by(id: id)
    end
    
    # def self.create(params)
    #   Book.create(params)
    # end
  
    # def self.update(id, params)
    #   book = Book.find_by(id: id)
    #   book.update(params) if book
    #   book
    # end
    
    # def self.destroy(id)
    #   book = Book.find_by(id: id) 
    #   book.destroy if book
    #   book
    # end
      
  end
end