class Variant < ApplicationRecord
  belongs_to :pokemon
  has_one :sprite_set, as: :sprites_on

  scope :by_pokemon, lambda { |pokemon_id|
    where('pokemon_id = ?', pokemon_id)
  }

  validates :pokemon_id, presence: true, numericality: {greater_than: 0}
  validates :name, presence: true, uniqueness: true
end
