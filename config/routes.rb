# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home_pages#main'

  get  'signup' => 'users#new'

  resources :users
end
