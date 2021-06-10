Rails.application.routes.draw do
  devise_for :user

  devise_scope :user do
    root 'devise/sessions#new'
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: "home#index"
  resources :home
  resources :products
  resources :categories
  resources :grocery_lists
  resources :grocery_list_products
end
