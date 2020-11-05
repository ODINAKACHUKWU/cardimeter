Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  patch "/admin/polls/:id/publish", to: "admin/polls#publish"
  patch "/admin/polls/:id/share", to: "admin/polls#share"

  resources :polls, only: [:show]
  resources :companies, only: [:show]
  resources :votes, only: [:create]

  namespace :admin do
    resources :companies, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :polls, only: [:index, :new, :create, :update, :show, :destroy]
    resources :items
    resources :shares, only: [:create, :edit, :update]
  end
end
