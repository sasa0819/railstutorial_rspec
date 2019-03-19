Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
  }
  resources :users, only: [:index]
  resources :microposts
  get "users/:id" => "users#show", as: :mypage
  root 'toppages#home'
  get '/help', to: 'toppages#help', as: 'helf'
end
