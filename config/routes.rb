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
    resources :comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  get "users/:id" => "users#show", as: :mypage
  root 'toppages#home'
  get '/help', to: 'toppages#help', as: 'helf'
end
