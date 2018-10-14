Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'user/sessions',
                                    passwords: 'user/passwords',
                                    confirmations: 'user/confirmations',
                                    unlocks: 'user/unlocks',
                                    registrations: 'user/registrations' }
  resources :vendors, only: :index do
    member do
      get :new_user
      post :create_user
    end
  end
  resources :companies, only: %i[index] do
    collection do
      patch :approve
      patch :freeze
      get :new_2nd_vendor
      post :create_2nd_vendor
    end
  end
  resources :courses, except: %i[edit] do
    member do
      patch :publish
      get :select_company_changed
      delete :delete_trainee
    end
    collection do
      get :available
    end
    resources :rsvp, only: %i[update]
  end

  resources :circulars, only: %i[index new create destroy]
  root to: 'home#index'
end
