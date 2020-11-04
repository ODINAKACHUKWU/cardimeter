Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :polls, only: [:index, :show]

  namespace :admin do
    resources :companies, only: [:new, :create, :edit, :update, :destroy]
    resources :polls, only: [:new, :create, :update, :show, :destory]
    resources :items
  end
end
