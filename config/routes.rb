Rails.application.routes.draw do
  root "spaces#index"
  resources :spaces, only: [:index]
  resources :tags, only: [:show, :update]
end
