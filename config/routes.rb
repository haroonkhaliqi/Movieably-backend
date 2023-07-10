Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/movies" => "movies#index"
  post "/movies" => "movies#create"
  get "movies/:id" => "movies#show"
  patch "/movies/:id" => "movies#update"
end
