Rails.application.routes.draw do
  devise_for :users
  
  root "boards#index"
  root "houses#index"
  

  resources :boards do 
    resources :lists
  end 

  resources :lists do 
    resources :tasks 
  end 

  resources :houses
end
