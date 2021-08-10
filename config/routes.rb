Rails.application.routes.draw do
  resources :borrowed_books, except: %i[ edit update]
  resources :users
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
