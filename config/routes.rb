Rails.application.routes.draw do
  root 'toppages#home'
  get   '/help', to: 'toppages#help', as: 'helf'
end
