Rails.application.routes.draw do

  root :to => 'questions#index'
  resources :sessions, only: [:create, :destroy, :new]
  resources :users
  resources :questions do
    resources :answers, except: :show do
      resources :votes, only: [:create, :destroy]
    end
  end
end
