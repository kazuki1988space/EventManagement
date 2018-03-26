Rails.application.routes.draw do

  root to: 'tops#index'

  resources :events do
    collection do
      post :confirm
    end
  end

  resources :questions do
    collection do
      post :confirm
    end
  end

  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :participants, only: [:create, :show, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
