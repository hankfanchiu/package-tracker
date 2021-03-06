Rails.application.routes.draw do
  root to: 'static_pages#root'

  resources :packages, only: [:create, :update]
  resource :webhooks, only: [:create]

  get '*path', to: 'static_pages#root'
end
