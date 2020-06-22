Rails.application.routes.draw do
  get 'transfers/new'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'teams#index'
  resources :teams
  resources :transfers
  resources :players
end
