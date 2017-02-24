Rails.application.routes.draw do
  get 'comentario', to: 'comentarios#create'
  resources :locals
  root to: 'locals#create'
end
