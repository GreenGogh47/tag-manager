Rails.application.routes.draw do
  resources :spaces, only: [:index]
  resources :tags, only: [:update]
end
