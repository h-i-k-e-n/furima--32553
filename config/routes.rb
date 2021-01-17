Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'items#index'


resources :items, except: [ :index] do
  resources :consumer, only: [:index, :new, :create]


end
resources :users, only: :show


end
