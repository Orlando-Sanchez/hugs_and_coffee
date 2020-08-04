Rails.application.routes.draw do
  devise_for :users
  resources :profiles
  resources :publications, except: :show
  resources :monetary_accounts, except: :show
  put '/toggle_profile', to: 'profiles#toggle_profile'
  root to: "home#index"
end
