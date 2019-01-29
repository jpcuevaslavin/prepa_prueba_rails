Rails.application.routes.draw do
  
  get 'products/favourites'
  resources :products, except: :new
  patch 'products/:id/set_favourite', to: 'products#set_favourite', as: 'set_favourite'

  root 'products#index'
end
