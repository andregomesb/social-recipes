Rails.application.routes.draw do
  root to: 'recipes#index'

  resources :cuisines, only:[:new, :create, :show, :edit, :update, :destroy]
  resources :meals, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :recipes do
    get 'search', on: :collection
    put 'favorite', on: :member
    post 'share', on: :member
  end

  resources :users, only:[:create, :show, :edit, :update, :destroy] do
    get 'recipes', to: 'users#show_recipes', on: :member
  end

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
