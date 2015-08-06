Rails.application.routes.draw do
  resources :payments
  root to: 'visitors#index'
end
