Rails.application.routes.draw do
root "sessions#home"

get '/signup' => 'users#new'
post '/signup' => 'users#create'

get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
delete '/signout' => 'sessions#destroy'

resources :teams do
  resources :tryouts, only: [:new,:create,:index]
end
  resources :tryouts
  resources :users do
    resources :teams, only: [:new,:create,:index]
  end


end
