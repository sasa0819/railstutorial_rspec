Rails.application.routes.draw do
  devise_for :users, path: '',
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:index] do
    member do
      get :following, :followers
    end
  end
  resources :microposts do
    member do
      post "like", to: "favorites#create"
    end
    resources :comments, only: [:create, :destroy]
  end
  resources :favorites, only: [:destroy]
  resources :relationships, only: [:create, :destroy]
  get "users/:id" => "users#show", as: :mypage
  root 'toppages#home'
  get '/help', to: 'toppages#help', as: 'helf'
end
