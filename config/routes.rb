Rails.application.routes.draw do
  root 'home#show'

  devise_for :users,
             controllers: {
                omniauth_callbacks: 'users/omniauth_callbacks',
                registrations: 'users/registrations'
              }

  resource :general, only: [:show, :create, :update]
  resource :profile, only: [:show, :create, :update]
  resource :motivation, only: [:show, :create, :update]
  resource :presentation, only: [:show, :create, :update]
  resources :educations
  resources :academics, only: [:index]
  resources :conferences, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :others, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :publications, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :trainings, only: [:new, :show, :edit, :create, :update, :destroy]
  resources :works
  resource :language, only: [:show, :create, :update]

  post '/submit', to: 'submit#submit', as: :submit

  resources :reviews, only: [:index, :show, :create] do
    scope module: :review_process do
      resource :general, only: :show
      resource :profile, only: :show
      resource :motivation, only: [:show, :update]
      resource :presentation, only: [:show, :update]
      resource :educations, only: [:show, :update]
      resource :academics, only: [:show, :update]
      resource :works, only: [:show, :update]
      resource :language, only: [:show, :update]
    end
  end
end
