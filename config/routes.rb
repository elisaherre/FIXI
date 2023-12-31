Rails.application.routes.draw do
  devise_for :fixers
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :fixers

  # Defines the root path route ("/")
  # root "articles#index"
  get "categories/:id", to: "categories#show", as: "category"
end
