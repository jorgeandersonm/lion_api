Rails.application.routes.draw do
#  devise_for :individuals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :good

  get '/good/:id', to: 'good#list'
 # get '/individuals/:id', to: 'individuals#show'

  get '/individuals/:city_name/by_city', to: 'individuals#by_city'


  mount_devise_token_auth_for 'Individual', at: 'auth'
end
