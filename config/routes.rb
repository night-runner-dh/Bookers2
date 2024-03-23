Rails.application.routes.draw do
 
  root to: "homes#top"

  get 'home/about', to: 'homes#about', as: :about
  devise_for :users
  
   
   resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
   resources :users, only: [:show, :edit, :index, :update]
   
end