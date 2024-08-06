# app/controllers/users_controller.rb
class BooksController < ApplicationController

  skip_before_action :verify_authenticity_token, only: [:create]

  def index 
      
      @books = BookListService.call
      render json: {notice: 'User was successfully created.', data:  @books}, status: 200
  end
    
  def create
    @book = BookRegistrationService.call(book_params)
    #@book = service.call
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
  