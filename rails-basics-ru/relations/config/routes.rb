# frozen_string_literal: true

Rails.application.routes.draw do
  get "tasks/index"
  resources :users
  resources :statuses
  resources :tasks, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
