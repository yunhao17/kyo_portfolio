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
    resources :spots
  end

  scope module: :public do
    resources :users
    resources :favorites, only:[:create, :destroy]
    resources :areas
    resources :purposes
    resources :spots, only:[:index, :show] do
      resources :spot_comments, only: [:create, :destroy]
      member do
        get :mokuteki_index
      end
    end
    get '/spots/:area_id/eria_index/:purpose_id', to: 'spots#eria_index', as: 'eria_purpose'
  end
end
