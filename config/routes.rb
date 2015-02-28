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
  resources :conferences, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :others, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :publications, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :works
  resource :language, only: [:show, :create, :update]

  post '/submit', to: 'submit#submit', as: :submit
end
