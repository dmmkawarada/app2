Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  get '/home/about', to: 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:top, :new, :edit, :update, :create, :index, :show, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
end
