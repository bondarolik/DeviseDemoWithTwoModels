Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  namespace :backoffice do
    resources :places

    root to: 'pages#dashboard'
  end

  resources :places, only: [:index, :show]

  get 'pages/dashboard', to: 'pages#dashboard', as: :dashboard
  root to: 'pages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
