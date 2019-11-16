Rails.application.routes.draw do
  devise_for :users
  root 'requests#index'
  resource :profile
  resources :requests, only: [:index, :create, :show, :new]
  resources :chats, only: [:index, :create]
  get 'approve/index' => 'approve#index'
  resources :accepted_requests, only: [:index]
end
