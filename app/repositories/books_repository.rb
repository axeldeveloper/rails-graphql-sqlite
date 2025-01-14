class BooksRepository

  def self.find_by_id(id)
    Rails.logger.info("BooksRepository Fetching book with ID: #{id}")
    Book.find_by(id: id)
  end

  def self.find_all
    Rails.logger.info("BooksRepository Fetching books all")
    Book.all
  end

  def self.find_limit(limit)
    Book.all.top(limit)
  end


  def self.create(book_params)
    @book = Book.new(book_params)
    if @book.save
      { success: true, book: @book }
    else
      @errors = @book.errors.full_messages
      { success: false, errors: @errors }
    end
  end


  def self.update(book_id, book_params)
    @book = self.find_by_id(book_id)
    return { success: false, errors: ['Book not found'] } unless @book

    if @book.update(book_params)
      { success: true, book: @book }
    else
      @errors = @book.errors.full_messages
      { success: false, errors: @errors }
    end
  end

  def self.destroy(id)
    book = Book.find_by(id: id)
    book&.destroy
    book
  end

  def self.search_by_title(title)
    Book.where('title ILIKE ?', "%#{title}%")
  end
end
