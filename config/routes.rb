Rails.application.routes.draw do
  resources :test, only: [:index]
  resources :spaces, only: [:index]
end
