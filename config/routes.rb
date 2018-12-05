Rails.application.routes.draw do
  root to: 'home#root'
  get 'static_pages/privacy_policy'
  get 'static_pages/terms_of_use'
  get 'static_pages/inquiry'
  devise_for :users, controllers: {
      omniauth_callbacks: 'users/omniauth_callbacks',
      registrations: 'users/registrations',
      sessions: 'users/sessions',
  }
  resources :relationships, only: [:create, :destroy, :new, :index]
end
