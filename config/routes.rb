Rails.application.routes.draw do

  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions'
  }

  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations',
  }
  
  # ゲストログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'public/users#top'
  get 'about' =>'public/users#about'

  namespace :admin do
    resources :areas
    resources :purposes
    resources :spots
  end

  scope module: :public do
    resources :users
    resources :areas
    resources :purposes
    resources :spots, only:[:index, :show] do
      resources :spot_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    get '/spots/:area_id/eria/:purpose_id', to: 'spots#eria_mokuteki', as: 'eria_purpose'
    get '/spots/mokuteki/:purpose_id', to: 'spots#mokuteki', as: 'mokuteki'
    
    get "search" => "searches#search"
  end
  
  
end
