require 'rails_helper'

RSpec.describe Pokemon, type: :model do
  let(:pokemon) { Pokemon.new(name: 'pikachu', height: 23, weight: 67, image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png", 
    experience: 0, indicator: 2)}
  let(:pokemon_test) { Pokemon.new(name: 'pikachu', height: 23, weight: 67, image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png", 
      experience: 0, indicator: 2)}

  before { pokemon.save }

  it 'name should be present' do
    expect(pokemon).to be_valid
  end

  it 'name should not be nil' do
    pokemon.name = nil
    expect(pokemon).to_not be_valid
  end

  it "validates uniqueness of name" do  
    expect(pokemon_test.save).to be(false)
    expect(pokemon_test.errors.full_messages).to include("Name has already been taken")
  end

  it 'weight should be greater-equal to 0' do
    expect(pokemon).to be_valid
  end

  it 'weight should not be minor to 0' do
    pokemon.weight = -1
    expect(pokemon).to_not be_valid
  end

  it 'height should be greater-equal to 0' do
    expect(pokemon).to be_valid
  end

  it 'height should not be minor to 0' do
    pokemon.height = -1
    expect(pokemon).to_not be_valid
  end

  it 'experience should be greater-equal to 0' do
    expect(pokemon).to be_valid
  end

  it 'experience should not be minor to 0' do
    pokemon.experience = -1
    expect(pokemon).to_not be_valid
  end

  it 'image should be present' do
    expect(pokemon).to be_valid
  end

  it 'image should not be nil' do
    pokemon.image = nil
    expect(pokemon).to_not be_valid
  end

  it 'image should be an url' do
    expect(pokemon).to be_valid
  end 

  it 'image should not be different than an url' do
    pokemon.image = 1
    expect(pokemon).to_not be_valid
  end

  it 'indicator should be present' do
    expect(pokemon).to be_valid
  end

  it 'indicator should not be nil' do
    pokemon.indicator = nil
    expect(pokemon).to_not be_valid
  end

  it 'indicator should be greater-equal to 0' do
    expect(pokemon).to be_valid
  end

  it 'indicator should not be minor to 0' do
    pokemon.indicator = -1
    expect(pokemon).to_not be_valid
  end
  
end
