class SpriteSet < ApplicationRecord
  belongs_to :sprites_on, polymorphic: true

  scope :by_pokemon, lambda { |sprites_on_id|
    where('sprites_on_id = ? and sprites_on_type = ?', sprites_on_id, 'Pokemon') 
  }
  scope :by_variant, lambda { |sprites_on_id|
    where('sprites_on_id = ? and sprites_on_type = ?', sprites_on_id, 'Variant') 
  }

end
