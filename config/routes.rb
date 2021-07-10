Rails.application.routes.draw do
  
  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions'
  }
  
  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations',
  }
  
  root to: 'public/users#top'
  get 'about' =>'public/users#about'
  
  namespace :admin do
    resources :areas
    resources :purposes
    resources :spots, only: [:new, :create, :index, :show, :destroy]
  end
  
  scope module: :public do
    resources :users
    resources :favorites, only:[:create, :destroy]
    resources :spot_comments, only:[:create, :destroy]
    resources :areas, only:[:index, :show]
    resources :purposes, only:[:index]
    resources :spots, only:[:index, :show]
  end
end
