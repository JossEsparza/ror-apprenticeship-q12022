module PokemonsHelper
  def pokemon_title page_mode, pokemon
     page_mode == :index ? link_to(pokemon.name, pokemon) : pokemon.name
  end
end
