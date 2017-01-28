Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes
  resources :cuisines, only:[:new, :create, :show]
  resources :meals, only: [:new, :create, :show]
  resources :users, only:[:create, :show] do
    get 'recipes', to: 'users#show_recipes', as:'recipes', on: :member
  end
  get    'search',   to: 'recipes#search'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
