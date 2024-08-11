class ApplicationService
  # DRY(Don't Repeat Yourself)
  def self.call(*ags, &block)
    puts '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
    puts "DRY(Don't Repeat Yourself)"
    puts block

    new(*ags, &block).call
  end
end
