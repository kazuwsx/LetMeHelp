Rails.application.routes.draw do
  devise_for :users
  root 'divide#index'
  resources :requests, only: [:index, :create, :show, :new]
  resources :accepted_requests, only: [:index]
  resources :posted_accepted_requests, only: [:index]
  resources :not_accepted_requests, only: [:index]
  resources :posted_requests, only: [:index]
  resource :profile, only: [:update]
  resources :chats, only: [:index, :create]
  resources :divide, only: [:index]
  resources :home, only: [:index]
  resources :helpers, only: [:index]
  resources :requesters, only: [:index]
  resources :approve, only: [:index]
  resources :submit_location, only: [:index]
end
