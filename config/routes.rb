Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'users#new'
post '/signup' => 'users#create'

delete '/signout' => 'sessions#destroy'

  resources :tryouts
  resources :users

  resources :teams do
    resources :tryouts
  end
end
