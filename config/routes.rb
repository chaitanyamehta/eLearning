Rails.application.routes.draw do
  resources :feedbacks
  resources :purchases
  resources :sections, only: [:index, :show, :new, :create] do
    get 'students', to: 'students#section_students', as: 'students'
  end
  resources :sessions, only: [:create]
  get 'signup', to: 'students#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :students
  resources :credit_cards, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :teachers
  resources :admins, only: [:show, :edit, :update]
  resources :courses do
    get 'add_to_cart', to: 'cart_items#new', as: 'add_to_cart'
  end
  delete 'cart_items/clear', to: 'cart_items#clear', as: 'clear_cart'
  resources :cart_items, only: [:create, :destroy]
  get 'cart', to: 'cart_items#index', as: 'cart'
  get 'home', to: 'static_pages#home', as: 'home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "static_pages#home"
end
