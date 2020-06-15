Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/signout' => 'sessions#destroy'



  resources :teams do
    resources :tryouts, only: [:new, :edit, :show]
  end

  resources :tryouts
  resources :users
  resources :teams 
end
