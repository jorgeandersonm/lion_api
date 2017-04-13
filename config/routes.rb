Rails.application.routes.draw do
  devise_for :individuals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/good/:id', to: 'good#list'
  get '/individual/:id', to: 'individual#show'
end
