Rails.application.routes.draw do

  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books do
    resources :book_comments, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]

end