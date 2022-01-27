class AbilityPokemonsController < ApplicationController
  layout 'application'
  protect_from_forgery prepend: true
  before_action :authenticate_user!, only: %i[new create edit update delete destroy]

  def index
    if (params[:pokemon])
      @ability_pokemons = AbilityPokemon.by_pokemon(params[:pokemon])
    else
      @ability_pokemons = AbilityPokemon.all
    end
  end

  def show
    @ability_pokemon = AbilityPokemon.find(params[:id])
  end

  def new
    @ability_pokemon = AbilityPokemon.new({pokemon_id: params[:pokemon]})
  end

  def create
    # Instantiate a new object using form parameters
    @ability_pokemon = AbilityPokemon.new(ability_pokemon_params)
    # Save the object
    if @ability_pokemon.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Ability associated successfully"
      redirect_to(ability_pokemons_path(pokemon: @ability_pokemon.pokemon))
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
    # Update the object
    if @ability_pokemon.update(ability_pokemon_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Ability updated successfully"
      redirect_to(ability_pokemons_path(pokemon: @ability_pokemon.pokemon))
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
    flash[:notice] = "Pokemon-Ability destroyed successfully"
    redirect_to(ability_pokemons_path(pokemon: @ability_pokemon.pokemon))
  end
  private

  def ability_pokemon_params
    params.require(:ability_pokemon).permit(:pokemon_id, :ability_id)
  end
end
