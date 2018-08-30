Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'user/sessions',
                                    passwords: 'user/passwords',
                                    confirmations: 'user/confirmations',
                                    unlocks: 'user/unlocks',
                                    registrations: 'user/registrations' }
  resources :vendors, only: :index do
    collection do
      get :pending
    end
    member do
      patch :lock_access
      get :new_user
      post :create_user
    end
  end
  resources :companies, only: %i[index] do
    collection do
      get :new_user
      post :create_user
    end
  end
  resources :courses, except: %i[edit] do
    member do
      patch :publish
    end
    collection do
      get :available
    end
    resources :rsvp, only: %i[update]
  end

  resources :circulars, only: %i[index new create destroy]
  root to: 'home#index'
end
