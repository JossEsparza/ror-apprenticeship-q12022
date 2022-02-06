class Ability < ApplicationRecord
  has_many :ability_pokemons, dependent: :destroy
  has_many :pokemons, through: :ability_pokemons

  scope :sorted, lambda { order("name ASC")}

  validates :name, presence: true, uniqueness: true
end
