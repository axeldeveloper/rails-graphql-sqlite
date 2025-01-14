# frozen_string_literal: true
class AuthorsRepository
    
    def self.find_all
      Author.all
    end

    def self.find_limit(limit)
      Author.all.top(limit)
    end

  
    def self.find_by_id(id)
      Author.find_by(id: id)
    end

    
    def self.create(author_params)
      @row = Author.new(author_params)
      if @row.save
        { success: true, author: @row }
      else
        @errors = @row.errors.full_messages
        { success: false, errors: @errors }
      end
    end


    def self.update(id, author_param)
      @author = Author.find_by(id: id)
      return { success: false, errors: ['Author not found'] } unless @author
  
      if @author&.update(author_param)
        { success: true, author: @author }
      else
        @errors = @author.errors.full_messages
        { success: false, errors: @errors }
      end

    end

    def self.destroy(id)
      author = Author.find_by(id: id)
      author&.destroy
      author
    end
  end
