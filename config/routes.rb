Rails.application.routes.draw do
  
  devise_for :admins, :controllers => {
  :sessions => 'admins/sessions'
  }
  
  devise_for :customers, :controllers => {
  :sessions => 'customers/sessions',
  :registrations => 'customers/registrations',
  }
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
