class Variant < ApplicationRecord
  belongs_to :pokemon 
  has_one :sprite_set, as: :sprites_on
end
