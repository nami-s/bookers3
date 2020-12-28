Rails.application.routes.draw do
  
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]

end