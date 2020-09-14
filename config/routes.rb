Rails.application.routes.draw do
  resources :feedbacks
  resources :purchases
  resources :carts
  resources :sections, only: [:index, :new, :create]
  resources :sessions, only: [:create]
  get 'signup', to: 'students#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :students do
    resources :credit_cards, only: [:show, :new, :create, :edit, :update, :destroy]
  end
  resources :teachers
  resources :admins, only: [:show, :edit, :update]
  resources :courses
  get 'home', to: 'static_pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "static_pages#home"
end
