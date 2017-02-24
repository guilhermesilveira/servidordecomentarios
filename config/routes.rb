Rails.application.routes.draw do
  resources :locals
  root to: 'locals#index'
end
