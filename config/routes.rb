Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get '/', to: 'games#new', as: :new
  post '/score(.:format)', to: 'games#score', as: :score
  # root "articles#index"
end
