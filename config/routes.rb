Rails.application.routes.draw do
  
  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions'
  }
  
  devise_for :users, :controllers => {
  :sessions => 'users/sessions',
  :registrations => 'users/registrations',
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  namespace :admin do
    resources :areas
    resources :purposes
    resources :spots
  end
end
