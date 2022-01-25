Rails.application.routes.draw do
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

  resources :variants
  resources :sprite_sets
  resources :abilities
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "pokemons#index"
end
