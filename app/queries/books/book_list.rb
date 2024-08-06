# app/queries/Book/book_list.rb
module Books
  class BookList

    def self.find_all
      Book.all()
    end

    def self.find_limit
      Book.all().top(2)
    end
  
    def self.find_by_id(id)
      Book.find_by(id: id)
    end
    
    def self.create_book(params)
      Book.create(params)
    end
  
    def self.update_book(id, params)
      book = Book.find_by(id: id)
      book.update(params) if book
      book
      end
    
    def self.destroy_book(id)
      book = Book.find_by(id: id) 
      book.destroy if book
      book
    end
      
  end
end