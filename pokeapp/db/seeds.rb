# This file should contain all the record creation needed to seed the database with its default values.
# frozen_string_literal: true

# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
URL = 'https://pokeapi.co/api/v2/pokemon/'
(1..500).each do |id|
  uri = URL + id.to_s
  retries = 0
  # Error handling connection
  begin
    retries += 1
    response = HTTParty.get(uri)
    raise NoConnection, "Not posible to connect to the API" if response.code != 200
  rescue NoConnection => e
    puts "#{e.message}"
     # Wait one second to retry
    sleep(1)
    retry if retries <= 3
  end

  if response.code == 200
    pokemon = JSON.parse(response.body)
    pokemon_sprites = pokemon['sprites']
    # Save pokemon data
    pokemon_element = Pokemon.create(name: pokemon['name'], height: pokemon['height'], weight: pokemon['weight'],
      image: pokemon_sprites['other']['official-artwork']['front_default'], experience: pokemon['base_experience'],
      indicator: pokemon['id'])

    # Save abilities data
    abilities = pokemon['abilities']
    abilities.each do |ability|
      ability_element = Ability.find_by_name(ability['ability']['name'])
      # If the ability doesn't exist, add it
      ability_element = Ability.create(name: ability['ability']['name']) if ability_element.nil?
      # pokemon_element.abilities.create(name: ability['ability']['name']) if ability_element.nil?
      AbilityPokemon.create(pokemon: pokemon_element, ability: ability_element)
      # pokemon_element.abilities.create(ability_element)
    end

    # Save forms data and sprites_set
    pokemon['forms'].drop(1).each do |form| 
      form_data = JSON.parse(HTTParty.get(form['url']).body)
      form_sprites = form_data['sprites']
      form_element = pokemon_element.variants.create(name: form['name'])
      sprite_set = SpriteSet.create(
        back_default: form_sprites['back_default'],
        back_female: form_sprites['back_female'],
        back_shiny: form_sprites['back_shiny'],
        back_shiny_female: form_sprites['back_shiny_female'],
        front_default: form_sprites['front_default'],
        front_female: form_sprites['front_female'],
        front_shiny: form_sprites['front_shiny'],
        front_shiny_female: form_sprites['front_shiny_female'])
      form_element.sprite_set = sprite_set
      form_element.save
    end

    # Save sprite_sets data
    sprite_set = SpriteSet.create(
      back_default: pokemon_sprites['back_default'],
      back_female: pokemon_sprites['back_female'],
      back_shiny: pokemon_sprites['back_shiny'],
      back_shiny_female: pokemon_sprites['back_shiny_female'],
      front_default: pokemon_sprites['front_default'],
      front_female: pokemon_sprites['front_female'],
      front_shiny: pokemon_sprites['front_shiny'],
      front_shiny_female: pokemon_sprites['front_shiny_female'])
    pokemon_element.sprite_set = sprite_set
    pokemon_element.save
  end
end
