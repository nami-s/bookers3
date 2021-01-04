Rails.application.routes.draw do

  get 'search' => 'searches#search'
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  delete 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  devise_for :users
  resources :users, only: [:show,:index,:edit,:update] do
    get :follower, :followed, on: :member
  end

end

