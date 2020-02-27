Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :skill_orders, only: [:index]
  resources :skills do
    resources :reviews, except: [:index, :show]
  end
  get 'skills/:skill_id/achat', to: 'skills#achat', as: 'achat'
  get 'skills/:skill_id/vente', to: 'skills#vente', as: 'vente'
  # post 'skills/search', to: 'skills#search', as: 'search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

