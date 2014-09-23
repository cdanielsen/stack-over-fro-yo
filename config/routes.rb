Rails.application.routes.draw do

  root :to => 'users#index'
  resources :sessions, only: [:create, :destroy, :new]
  resources :users
  resources :questions do
    resources :answers, except: [:index] do
      resources :votes, only: [:create, :destroy]
    end
  end
end
