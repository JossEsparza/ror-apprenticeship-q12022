require 'rails_helper'

RSpec.describe AbilityPokemon, type: :model do
  let(:pokemon) { Pokemon.new(name: 'pikachu', height: 23, weight: 67, image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png", 
    experience: 0, indicator: 2)}
  let(:ability) { Ability.new(name: 'ability-t')}
  let(:ability_pokemon) { AbilityPokemon.new(pokemon_id: 1, ability_id: 1)}
  let(:ability_pokemon_test) { AbilityPokemon.new(pokemon_id: 1, ability_id: 1)}

  before { 
    pokemon.save 
    ability.save
    ability_pokemon.pokemon_id = pokemon.id
    ability_pokemon.ability_id = ability.id
    ability_pokemon.save
  }

  it 'pokemon_id should be present' do
    expect(ability_pokemon).to be_valid
  end

  it 'pokemon_id should not be nil' do
    ability_pokemon.pokemon_id = nil
    expect(ability_pokemon).to_not be_valid
  end

  it 'pokemon_id should be greater to 0' do
    expect(ability_pokemon).to be_valid
  end

  it 'pokemon_id should not be minor to 0' do
    ability_pokemon.pokemon_id = -1
    expect(ability_pokemon).to_not be_valid
  end

  it "validates uniqueness of pokemon_id" do  
    ability_pokemon_test.pokemon_id = pokemon.id
    ability_pokemon_test.ability_id = ability.id
    expect(ability_pokemon_test.save).to be(false)
    expect(ability_pokemon_test.errors.full_messages).to include("Pokemon . This ability is already assigned to this pokemon")
  end
  
  it 'ability_id should be present' do
    expect(ability_pokemon).to be_valid
  end

  it 'ability_id should not be nil' do
    ability_pokemon.pokemon_id = nil
    expect(ability_pokemon).to_not be_valid
  end

  it 'ability_id should be greater to 0' do
    expect(ability_pokemon).to be_valid
  end

  it 'ability_id should not be minor to 0' do
    ability_pokemon.pokemon_id = -1
    expect(ability_pokemon).to_not be_valid
  end

end
