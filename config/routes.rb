Rails.application.routes.draw do
  root "spaces#index"
  resources :spaces, only: [:index]
  resources :tags, only: [:update]
end
