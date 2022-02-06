Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "pokemons#index"

  devise_for :users, controllers: { registrations: 'users/registrations'}

  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
    get 'sign_up', to: 'devise/registrations#new'
    get 'log_out', to: 'devise/sessions#destroy'
  end

  resources :ability_pokemons do
    member do
      get :delete
    end
  end

  resources :pokemons do
    member do
      get :delete
    end
  end

  resources :variants do
    member do
      get :delete
    end
  end
  resources :sprite_sets do
    member do
      get :delete
    end
  end

  resources :abilities do
    member do
      get :delete
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
