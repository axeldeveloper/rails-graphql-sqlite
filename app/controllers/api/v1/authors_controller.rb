# frozen_string_literal: true

# Controller Authors for managing authors in the API.

module Api
  module V1
    class AuthorsController < ApplicationController
      def index
        @authors = Author.all
        render 'api/v1/authors/index.json.jbuilder'
      end
    end
  end
end
