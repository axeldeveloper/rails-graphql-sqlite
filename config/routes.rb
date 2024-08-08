Rails.application.routes.draw do
  
  
  require 'sidekiq/web'
  require 'sidekiq/cron/web'
  mount Sidekiq::Web => '/sidekiq'
  
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"


  namespace :api do 
    namespace :v1 do 
      resources :books    # , only: [:index, :create]
      resources :authors  #, only: [:index, :create]
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
