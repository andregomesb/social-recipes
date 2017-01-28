Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes, only:[:index, :new, :create, :show]
  resources :cuisines, only:[:new, :create, :show]
  resources :meals, only: [:new, :create, :show]
  get 'search', to: 'recipes#search'

  resources :users, only:[:create, :show]
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
