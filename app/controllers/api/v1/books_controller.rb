# frozen_string_literal: true

# Controller Books for managing authors in the API.

module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book_params, only: %i[show destroy]

      def index
        @books = Books::ServiceBookList.call
        render 'api/v1/books/index.json.jbuilder', status: :ok
      end

      def show
        render 'api/v1/books/show.json.jbuilder', status: :ok
      end

      def categories
        @books = Rails.cache.fetch('books_by_category/Terror', expires_in: 1.hour) do
          # Simulação de uma consulta cara ao banco de dados
          q = params[:genre]
          if params[:status].presents
            Rails.logger.info q
            Rails.logger.info params[:status]
          end
          ::Books::BookByGenreQuery.new(genre: 'Horror').call.to_a
        end
        render 'api/v1/books/index.json.jbuilder', status: :ok
      end

      def create
        @book = Books::ServiceBookRegistration.call(book_params)
        if @book.is_a?(Book)
          render 'api/v1/books/show.json.jbuilder', status: :created
        else
          render :new
        end
      end

      def update
        @book = ::Books::ServiceBookUpdate.new(id: params[:id], params: book_params).call
        if @book.is_a?(Book)
          render 'api/v1/books/show.json.jbuilder', status: :ok
        else
          render :new
        end
      end

      def destroy
        @book.destroy
        # render json: nil, status: :no_content
        head :no_content
      end

      private

      def book_params
        params.require(:book).permit(:title, :publication_date, :genre, :author_id)
      end

      def set_book_params
        @book = ::Books::BookListQuery.find_by_id(params[:id])
      end
    end
  end
end
