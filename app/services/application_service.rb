class ApplicationService
    # DRY(Don't Repeat Yourself)
    def self.call(*ags, &block)
        new(*ags, &block).call
    end

end