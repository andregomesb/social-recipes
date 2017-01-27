Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes, only:[:index, :new, :create, :show]
  resources :cuisines, only:[:new, :create, :show]
  resources :meals, only: [:new, :create, :show]
  get 'search', to: 'recipes#search'
end
