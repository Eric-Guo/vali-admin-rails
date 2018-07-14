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
      patch :unlock_access
      patch :lock_access
      get :new_user
      post :create_user
    end
  end
  root to: 'home#index'
end
