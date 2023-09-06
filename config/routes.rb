Rails.application.routes.draw do
  devise_for :fixers
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "categories/:id", to: "categories#show", as: "category"
  # get "user_reviews/new", to: "user_reviews#new", as: new_user_review
  resources :users, only: [] do
    resources :user_reviews, only: [:new, :create]
  end
end
