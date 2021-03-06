Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers

  patch "capture", to: 'pokemons#capture'

  get "pokemons", to: 'pokemon#new'
  post "pokemons", to: 'pokemon#create' 
end
