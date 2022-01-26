class AbilityPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability

  scope :by_pokemon, lambda { |pokemon|
    where('pokemon_id = ?', pokemon) 
  }
end
