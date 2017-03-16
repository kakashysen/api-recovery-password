Rails.application.routes.draw do

  get '/password_reset/:tmp_token', to: 'password_reset#index'  
	post '/password_reset/reset', to: 'password_reset#reset' 
	
  post '/users/password_reset', to: 'users#password_reset'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
