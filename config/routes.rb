Rails.application.routes.draw do
  devise_for :users
  resources :profiles
  put '/toggle_profile', to: 'profiles#toggle_profile'
  root to: "home#index"
end
