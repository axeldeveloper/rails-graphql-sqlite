class HardWorker
    include Sidekiq::Worker
    # queue_as :default
  
  def perform(*args)
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    puts "HardWorker with args: #{args}" 
    puts " HardWorker  in"
    sleep 2
  end

end