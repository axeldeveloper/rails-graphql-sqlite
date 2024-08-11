# app/queries/Book/author_list.rb
module Books
  class AuthorList
    def self.find_all
      Author.all
    end

    def self.find_limit
      Author.all.top(2)
    end

    def self.find_by_id(id)
      Author.find_by(id: id)
    end

    def self.create(params)
      Author.create(params)
    end

    def self.update(id, params)
      author = Author.find_by(id: id)
      author.update(params) if author
      author
    end

    def self.destroy(id)
      author = Author.find_by(id: id)
      author.destroy if author
      author
    end
  end
end
