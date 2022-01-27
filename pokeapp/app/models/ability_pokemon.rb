class AbilityPokemon < ApplicationRecord
  belongs_to :pokemon
  belongs_to :ability

  scope :by_pokemon, lambda { |pokemon|
    where('pokemon_id = ?', pokemon) 
  }
  validates :pokemon_id, presence: true, numericality: {greater_than: 0}, 
  uniqueness: {scope: :ability_id, message: '. This ability is already assigned to this pokemon'}
  validates :ability_id, presence: true, numericality: {greater_than: 0}

end
