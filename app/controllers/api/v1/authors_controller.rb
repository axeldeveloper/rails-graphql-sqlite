class Api::V1::AuthorsController < ApplicationController
    


    def index 
        @authors = Author.all()
        # render json: {notice: 'User was successfully created.', data:  @books}, status: 200
        # render :json => @authors
        render 'api/v1/authors/index.json.jbuilder'
    end
end
