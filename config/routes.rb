Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies do
    resources :jobs
    resources :contacts, only: :create
  end

  resources :jobs do
    resources :comments, only: :create
  end

  resources :categories

  resources :dashboard, only: :index
end
