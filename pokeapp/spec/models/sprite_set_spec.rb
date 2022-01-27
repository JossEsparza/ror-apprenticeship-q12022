require 'rails_helper'

RSpec.describe SpriteSet, type: :model do
  let(:pokemon) { Pokemon.new(name: 'pikachu', height: 23, weight: 67, image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png", 
    experience: 0, indicator: 2)}
  let(:variant) { Variant.new(pokemon_id: 1, name: 'variant-a')}
  let(:sprite_set) { SpriteSet.new( sprites_on_id: 1, sprites_on_type: 'Pokemon',
    back_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/132.png",
    back_female: nil,
    back_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/back/shiny/132.png",
    back_shiny_female: nil,
    front_default: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png",
    front_female: nil,
    front_shiny: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/shiny/132.png",
    front_shiny_female: nil)}

  before { 
    pokemon.save 
    variant.pokemon = pokemon 
    variant.save
    sprite_set.sprites_on_id = pokemon.id
    sprite_set.save
   }

   it 'sprites_on_id should be present' do
    expect(sprite_set).to be_valid
  end

  it 'sprites_on_id should not be nil' do
    sprite_set.sprites_on_id = nil
    expect(sprite_set).to_not be_valid
  end

  it 'sprite_on_id should be greater to 0' do
    expect(sprite_set).to be_valid
  end

  it 'sprite_on_id should not be minor to 0' do
    sprite_set.sprites_on_id = -1
    expect(sprite_set).to_not be_valid
  end

  it 'sprites_on_type should be present' do
    expect(sprite_set).to be_valid
  end

  it 'sprites_on_type should not be nil' do
    sprite_set.sprites_on_type = nil
    expect(sprite_set).to_not be_valid
  end
  
  it 'back_default should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'back_default should not have more than 255 characters' do
    sprite_set.back_default = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'back_default should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'back_default should not be different than an url' do
    sprite_set.back_default = 1
    expect(sprite_set).to_not be_valid
  end

  it 'back_female should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'back_female should not have more than 255 characters' do
    sprite_set.back_female = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'back_female should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'back_female should not be different than an url' do
    sprite_set.back_female = 1
    expect(sprite_set).to_not be_valid
  end

  it 'back_shiny should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'back_shiny should not have more than 255 characters' do
    sprite_set.back_shiny = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'back_shiny should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'back_shiny should not be different than an url' do
    sprite_set.back_shiny = 1
    expect(sprite_set).to_not be_valid
  end

  it 'back_shiny_female should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'back_shiny_female should not have more than 255 characters' do
    sprite_set.back_shiny_female = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'back_shiny_female should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'back_shiny_female should not be different than an url' do
    sprite_set.back_shiny_female = 1
    expect(sprite_set).to_not be_valid
  end

  it 'front_default should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'front_default should not have more than 255 characters' do
    sprite_set.front_default = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'front_default should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'front_default should not be different than an url' do
    sprite_set.front_default = 1
    expect(sprite_set).to_not be_valid
  end

  it 'front_female should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'front_female should not have more than 255 characters' do
    sprite_set.front_female = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'front_female should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'front_female should not be different than an url' do
    sprite_set.front_female = 1
    expect(sprite_set).to_not be_valid
  end

  it 'front_shiny should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'front_shiny should not have more than 255 characters' do
    sprite_set.front_shiny = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'front_shiny should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'front_shiny should not be different than an url' do
    sprite_set.front_shiny = 1
    expect(sprite_set).to_not be_valid
  end

  it 'front_shiny_female should be maximum 255 characters' do
    expect(sprite_set).to be_valid
  end

  it 'front_shiny_female should not have more than 255 characters' do
    sprite_set.front_shiny_female = "0" * 256
    expect(sprite_set).to_not be_valid
  end

  it 'front_shiny_female should be an url' do
    expect(sprite_set).to be_valid
  end

  it 'front_shiny_female should not be different than an url' do
    sprite_set.front_shiny_female = 1
    expect(sprite_set).to_not be_valid
  end

end
