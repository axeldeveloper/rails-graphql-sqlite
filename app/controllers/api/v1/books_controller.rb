class Api::V1::BooksController < ApplicationController
    
    # skip_before_action :verify_authenticity_token, only: [:create]

    def index 
        @books = BookListService.call
        render json: {notice: 'User was successfully created.', data:  @books}, status: 200
    end
  
    def list
      @books = Rails.cache.fetch('books_by_category/fiction', expires_in: 12.hours) do
        # Simulação de uma consulta cara ao banco de dados
        Book.where(genre: 'Fiction').to_a
      end
    end
      
    def create
      @book = BookRegistrationService.call(book_params)
      if @book.is_a?(Book)
        render json: {notice: 'User was successfully created.', data:  @book}, status: 204
      else
        render :new
      end
    end
    
    private
    
    def book_params
        params.require(:book).permit(:title, :publication_date, :genre, :author_id)
    end
  end
    
