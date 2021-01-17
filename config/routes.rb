Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'items#index'
<<<<<<< Updated upstream
resources :items, only: [ :new, :create, :show, :edit, :update] do
=======
resources :items, only: [ :new, :create, :show, :edit, :update, :destroy] do
  resources :consumer, only: [:index, :new, :create]
>>>>>>> Stashed changes
end
resources :users, only: :show


end
