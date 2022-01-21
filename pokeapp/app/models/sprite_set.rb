class SpriteSet < ApplicationRecord
  belongs_to :sprites_on, polymorphic: true
end
