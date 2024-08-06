require "rails_helper"

RSpec.describe Author, type: :model do
  context "with 2 or more comments" do

    it "orders them in reverse chronologically" do
      a = Author.create!
      a1 = a.books.create!(:title => "first comment",  publication_date: 1977, genre: 'Horror')
      a2 = a.books.create!(:title => "second comment", publication_date: 1977, genre: 'Musical')
      # Espera-se que o livro mais recente (a1) venha antes do livro mais antigo (a2)
      expect(a.books.order(publication_date: :desc)).to eq([a1, a2])
    end

    it "Manys books" do 
       should have_many(:books) 
    end

  end
end