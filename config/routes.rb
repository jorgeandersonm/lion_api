Rails.application.routes.draw do
#  devise_for :individuals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :goods

  get '/goods/list/:id', to: 'goods#list'
 # get '/individuals/:id', to: 'individuals#show'

  get '/individuals/:city_name/by_city', to: 'individuals#by_city'
  get '/individuals/by_goods_value', to: 'individuals#by_goods_value'

  mount_devise_token_auth_for 'Individual', at: 'auth'
end
