Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :pays 
  resources :pay_categories
end
