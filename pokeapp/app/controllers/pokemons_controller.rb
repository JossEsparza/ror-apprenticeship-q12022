class PokemonsController < ApplicationController
  def index
    @pokemons = Pokemon.sorted
  end

  def show
  end

  def new
  end

  def create
    
  end

  def edit
  end

  def delete
  end
end
