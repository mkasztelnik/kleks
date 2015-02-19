Rails.application.routes.draw do
  root 'profiles#show'

  devise_for :users,
             controllers: {
                omniauth_callbacks: 'users/omniauth_callbacks',
                registrations: 'users/registrations'
              }

  resource :profile, only: [:show, :create, :update]
  resource :motivation, only: [:show, :create, :update]
  resource :presentation, only: [:show, :create, :update]
  resources :educations
  resources :academics, only: [:index]
  resources :works
  resource :language, only: [:show, :create, :update]
end
