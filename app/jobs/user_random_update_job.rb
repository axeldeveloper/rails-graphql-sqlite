class UserRandomUpdateJob < ApplicationJob
    queue_as :default
  
    def perform(*args)
      puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
      puts ":: UserRandomUpdateJob :: "
      message = "Book update info with ID: => #{randomize_id}"
      puts message
      sleep 10
    end


    
    def randomize_id
      # Using Postgresql or SQLite, using RANDOM():
      # id = Book.order("RANDOM()").first.id
      id = Book.find(Book.pluck(:id).sample).id
      # id = Book.first(offset: rand(Book.count)).id
      #begin
      #  id = SecureRandom.random_number(1_000_000)
      #end while Book.where(id: id).exists?
    end

  end