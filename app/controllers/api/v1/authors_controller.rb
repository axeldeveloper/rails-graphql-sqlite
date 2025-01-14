# frozen_string_literal: true

# Api::V1::AuthorsController is responsible for handling requests related to authors.
# It provides actions to manage and retrieve authors from the API
module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        @authors = Author.all
        render 'api/v1/authors/index'
      end
    end
  end
end
