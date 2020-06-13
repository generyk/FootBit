Rails.application.routes.draw do

get '/signup' => 'users#new'
post '/signup' => 'users#create'

  resources :tryouts
  resources :users

  resources :teams do
    resources :tryouts
  end
end
