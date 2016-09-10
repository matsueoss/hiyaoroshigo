Rails.application.routes.draw do
  devise_for :drinkers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :terms, only: [:show]
  get :signup, to: "devise/registrations#new"
  resources :festivals, only: [:index, :show]
  resources :restaurants, only: [:index, :show] do
    resources :sakes, only: [:index]
    resources :checkins, only: [:index, :create]
  end
  resources :drinkings, only: [:index, :new, :create, :delete, :show]
  get :itsitoolate, to: "festivals#itstoolate"
  get :thewinner, to: "festivals#thewinner"
end
