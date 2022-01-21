class Pokemon < ApplicationRecord
  has_one :sprite_set, as: :sprites_on
  has_many :variants

  has_many :ability_pokemons
  has_many :abilities, through: :ability_pokemons

  scope :sorted, lambda { order("name ASC")}
end
