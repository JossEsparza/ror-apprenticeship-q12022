module SpriteSetsHelper
  def sprite_set_title pokemon, variant, sprite_sets
    params[:pokemon] || params[:variant] ? sprite_sets.first.sprites_on_type : "Variant/Pokemon"
  end
end
