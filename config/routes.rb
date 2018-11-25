Rails.application.routes.draw do
  get 'static_pages/privacy_policy'
  get 'static_pages/terms_of_use'
  get 'static_pages/inquiry'
  root to: "static_pages#home"
  # get "relationships/new"
  # get "relationships/index"
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
  }
  resources :relationships, only: [:create, :destroy, :new, :index]
end
