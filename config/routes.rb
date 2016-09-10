Rails.application.routes.draw do
  devise_for :drinkers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :terms, only: [:show]
  get :signup, to: "devise/registrations#new"
  resources :festivals, only: [:index, :show]
  resources :restaurants, only: [:index, :show] do
    resources :sakes, only: [:index]
  end
  resources :drinkings, only: [:index, :new, :create, :delete]
  get :itsitoolate, to: "festivals#itstoolate"
  get :thewinner, to: "festivals#thewinner"
  resources :checkins, only: [:new, :create]
end
