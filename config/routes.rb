Rails.application.routes.draw do
  resources :sessions, only: [:create]
  get 'signup', to: 'students#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :students
  resources :teachers
  resources :admins
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "courses#index"
end
