# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Books::BookListQuery, type: :model do
  let(:author_attr) { { first_name: 'Stephen', last_name: 'King', date_of_birth: Date.parse('1947-09-21') } }

  let(:author) { Author.create!(author_attr) }

  let(:valid_attributes) do
    { title: 'Anything', genre: 'Horror', author: author, publication_date: DateTime.now, author_id: 1 }
  end

  let(:book) { Book.create!(valid_attributes) }

  describe '.find_all' do
    it 'returns all books' do
      book
      expect(Books::BookListQuery.find_all).to include(book)
    end
  end

  describe '.find_limit' do
    it 'returns a limited number of books' do
      3.times { Book.create!(valid_attributes) }
      expect(Books::BookListQuery.find_limit.count).to eq(2)
    end
  end

  describe '.find_by_id' do
    it 'returns the book with the given id' do
      expect(Books::BookListQuery.find_by_id(book.id)).to eq(book)
    end
  end
end
