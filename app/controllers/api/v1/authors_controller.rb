class Api::V1::AuthorsController < ApplicationController
    
    def index 
        @authors = Author.all()
        render 'api/v1/authors/index.json.jbuilder'
    end
end
