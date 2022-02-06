class SpriteSet < ApplicationRecord
  belongs_to :sprites_on, polymorphic: true

  scope :by_pokemon, lambda { |sprites_on_id|
    where('sprites_on_id = ? and sprites_on_type = ?', sprites_on_id, 'Pokemon') 
  }
  scope :by_variant, lambda { |sprites_on_id|
    where('sprites_on_id = ? and sprites_on_type = ?', sprites_on_id, 'Variant') 
  }
  URL_REGEX = /((http|https):\/\/)?[a-z0-9]+([-.]{1}[a-z0-9]+).[a-z]{2,5}(:[0-9]{1,5})?(\/.)?/ix
  validates :sprites_on_id, presence: true, numericality: {greater_than: 0}
  validates :sprites_on_type, presence: true
  validates :back_default, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }
  validates :back_female, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }
  validates :back_shiny, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }
  validates :back_shiny_female, length: { maximum: 255}, format: {  :with => URL_REGEX, allow_blank: true }
  validates :front_default, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }
  validates :front_female, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }
  validates :front_shiny, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }
  validates :front_shiny_female, length: { maximum: 255 }, format: {  :with => URL_REGEX, allow_blank: true }

end
