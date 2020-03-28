# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  get 'users/sign_up' => 'users#new'
  post 'users/sign_up' => 'users#create'
  get 'users/sign_in' => 'sessions#new'
  post 'users/sign_in' => 'sessions#create'
  delete 'log_out' => 'sessions#destroy'
  resources :users, only: %i[show edit update]
  resources :categories, only: %i[index]
  namespace :admin do
    resources :categories, only: %i[new create]
  end
end
