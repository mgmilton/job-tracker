Rails.application.routes.draw do
  root to: "companies#index"

  resources :companies do
    resources :jobs
    resources :contacts
  end

  resources :jobs do
    resources :comments
  end

  resources :categories
end
