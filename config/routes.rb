Rails.application.routes.draw do
  root to: "home#index"
  # get "relationships/new"
  # get "relationships/index"
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
  }
  resources :relationships, only: [:create, :destroy, :new, :index]
end
