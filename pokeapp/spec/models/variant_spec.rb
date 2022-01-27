require 'rails_helper'
require 'pp'
RSpec.describe Variant, type: :model do
  let(:pokemon) { Pokemon.new(name: 'pikachu', height: 23, weight: 67, image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png", 
    experience: 0, indicator: 2)}
  let(:variant) { Variant.new(pokemon_id: 1, name: 'variant-a')}
  let(:variant_test) { Variant.new(name: 'variant-a')}

  before { 
    pokemon.save 
    variant.pokemon = pokemon 
    variant.save }

  it 'pokemon_id should be present' do
    expect(variant).to be_valid
  end

  it 'pokemon_id should not be nil' do
    variant.pokemon_id = nil
    expect(variant).to_not be_valid
  end

  it 'pokemon_id should be greater to 0' do
    expect(variant).to be_valid
  end

  it 'pokemon_id should not be minor to 0' do
    variant.pokemon_id = -1
    expect(variant).to_not be_valid
  end

  it 'name should be present' do
    expect(variant).to be_valid
  end

  it 'name should not be nil' do
    variant.name = nil
    expect(variant).to_not be_valid
  end

  it "validates uniqueness of name" do  
    expect(variant_test.save).to be(false)
    expect(variant_test.errors.full_messages).to include("Name has already been taken")
  end
end
