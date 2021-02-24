Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ligues, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resources :participations, only: [:create, :new]
  end
  resources :line_ups, only: [:show, :create, :update] do

  end
  resources :teams, only: :index
  resources :players, only: :index


end
