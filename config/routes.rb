Rails.application.routes.draw do
  resources :spaces, only: [:index]
end
