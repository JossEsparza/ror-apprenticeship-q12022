class Pokemon < ApplicationRecord
  has_one :sprite_set, as: :sprites_on
  has_many :variants, dependent: :destroy

  has_many :ability_pokemons, dependent: :destroy
  has_many :abilities, through: :ability_pokemons

  scope :sorted, lambda { order("name ASC")}

  URL_REGEX = /((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?/ix
  validates :name, presence: true, uniqueness: true
  validates :weight, numericality: {greater_than_or_equal_to: 0}
  validates :height, numericality: {greater_than_or_equal_to: 0}
  validates :experience, numericality: {greater_than_or_equal_to: 0}
  validates :image, presence: true, format: URL_REGEX
  validates :indicator, numericality: {greater_than_or_equal_to: 0}, presence: true
end
