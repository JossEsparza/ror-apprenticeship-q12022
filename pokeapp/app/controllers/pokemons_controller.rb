class PokemonsController < ApplicationController
  layout 'application'

  def index
    @pokemons = Pokemon.sorted.paginate(page: params[:page], per_page: 9)
  end
  
  def show
    @pokemon = Pokemon.find(params[:id])
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    # Instantiate a new object using form parameters
    @pokemon = Pokemon.new(pokemon_params)
    # Save the object
    if @pokemon.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Pokemon created successfully"
      redirect_to(pokemons_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @pokemon = Pokemon.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @pokemon = Pokemon.find(params[:id])
    # Update the object
    if @pokemon.update(pokemon_params)
      # If save succeeds, redirect to the show action
      flash[:notice] = "Pokemon updated successfully"
      redirect_to(pokemons_path(@pokemon))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @pokemon = Pokemon.find(params[:id])
  end

  def destroy
    @pokemon = Pokemon.find(params[:id])
    @pokemon.destroy
    flash[:notice] = "Pokemon #{@pokemon.name} destroyed successfully"
    redirect_to(pokemons_path)
  end
  private

  def pokemon_params
    params.require(:pokemon).permit(:name, :height, :weight, :image, :experience, :indicator)
  end
end
