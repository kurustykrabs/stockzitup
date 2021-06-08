Rails.application.routes.draw do
  devise_for :user
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  resources :products
  resources :categories
  resources :grocery_lists
  resources :grocery_list_products
  resources :ars
end
