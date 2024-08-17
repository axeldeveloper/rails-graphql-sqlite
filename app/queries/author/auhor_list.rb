# frozen_string_literal: true

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
      author&.update(params)
      author
    end

    def self.destroy(id)
      author = Author.find_by(id: id)
      author&.destroy
      author
    end
  end
end
