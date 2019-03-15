Rails.application.routes.draw do
  devise_for :users
  root 'toppages#home'
  get   '/help', to: 'toppages#help', as: 'helf'
end
