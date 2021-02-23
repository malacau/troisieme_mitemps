Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ligues, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resources :participations, only: [:create, :new]
  end
  resources :line_up, only: [:show, :create, :update] do

  end


end
