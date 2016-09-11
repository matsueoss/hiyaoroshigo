Rails.application.routes.draw do
  devise_for :drinker, controllers:{ omniauth_callbacks: "drinker/omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :terms, only: [:show]
  get :signup, to: "devise/registrations#new"
  resources :festivals, only: [:index, :show]
  get "/restaurants/map", to: "restaurants#map"
  resources :restaurants, only: [:index, :show] do
    resources :sakes, only: [:index]
  end
<<<<<<< HEAD
  resources :drinkings, only: [:index, :new, :create, :delete, :show]
=======
  resources :drinkers, only: [:show, :edit, :update]
  resources :drinkings, only: [:index, :new, :create, :delete]
>>>>>>> upstream/master
  get :itsitoolate, to: "festivals#itstoolate"
  get :thewinner, to: "festivals#thewinner"
  resources :checkins, only: [:new, :create, :show]
end
