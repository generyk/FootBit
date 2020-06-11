Rails.application.routes.draw do
  
  resources :tryouts
  resources :users

  resources :teams do
    resources :tryouts
  end
end
