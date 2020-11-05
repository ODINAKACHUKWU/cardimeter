Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :polls, only: [:index, :show]

  namespace :admin do
    resources :companies, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :polls, only: [:index, :new, :create, :update, :show, :destroy]
    resources :items
    resources :shares, only: [:create, :edit, :update]
  end
end
