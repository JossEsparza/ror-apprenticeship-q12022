class AbilityPokemonsController < ApplicationController
  layout 'application'

  def index
    @ability_pokemons = AbilityPokemon.all
  end

  def show
    @ability_pokemon = AbilityPokemon.find(params[:id])
  end

  def new
    @ability_pokemon = AbilityPokemon.new
  end

  def create
    # Instantiate a new object using form parameters
    @ability_pokemon = AbilityPokemon.new(ability_pokemon_params)
    # Save the object
    if @ability_pokemon.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Ability associated successfully"
      redirect_to(ability_pokemons_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @ability_pokemon = AbilityPokemon.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @ability_pokemon = AbilityPokemon.find(params[:id])
    @ability_pokemon = AbilityPokemon.new(ability_pokemon_params)
    # Update the object
    if @ability_pokemon.update_attributes(ability_pokemon_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Ability updated successfully"
      redirect_to(pokemons_path(@ability_pokemon))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @ability_pokemon = AbilityPokemon.find(params[:id])
  end

  def destroy
    @ability_pokemon = AbilityPokemon.find(params[:id])
    @ability_pokemon.destroy
    flash[:notice] = "Ability #{@pokemon.name} destroyed successfully"
    redirect_to(ability_pokemons_path)
  end
  private

  def ability_pokemon_params
    params.require(:ability_pokemon).permit(:pokemon, :ability)
  end
end
