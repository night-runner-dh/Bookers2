Rails.application.routes.draw do
 
  root to: "homes#top"
  get 'homes/top' => 'homes#top', as: :top
  get 'homes/about' => 'homes#about', as: :about
  devise_for :users
  
  
   resources :books, only: [:new, :create, :index, :show,:destroy, :edit, :update]
   resources :users, only: [:show, :edit, :index, :update]
   
end