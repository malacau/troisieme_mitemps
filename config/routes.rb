Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ligues, only: [:index, :show, :new, :create] do
    resources :messages, only: [:index, :create]
    resources :participations, only: [:create, :new]
  end
  resources :line_ups, only: [:index, :show, :create, :update]
  resources :teams, only: :index
  resources :players, only: :index
  post "/players/search", to: "players#search", as: "search"
  resources :selections, only: [:update]
  get "/selections/score", to: "selections#score", as: "score"
  get "/rules", to: 'pages#rules', as: "rules"
end
