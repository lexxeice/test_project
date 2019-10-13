# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_pages#main'

  get    'login' => 'sessions#new'
  post   'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  get 'shop' => 'products#new'

  resources :users
  resources :products
end
