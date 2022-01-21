class SpriteSetsController < ApplicationController
  before_action :set_sprite_set, only: %i[ show edit update destroy ]

  # GET /sprite_sets or /sprite_sets.json
  def index
    @sprite_sets = SpriteSet.all
  end

  # GET /sprite_sets/1 or /sprite_sets/1.json
  def show
  end

  # GET /sprite_sets/new
  def new
    @sprite_set = SpriteSet.new
  end

  # GET /sprite_sets/1/edit
  def edit
  end

  # POST /sprite_sets or /sprite_sets.json
  def create
    @sprite_set = SpriteSet.new(sprite_set_params)

    respond_to do |format|
      if @sprite_set.save
        format.html { redirect_to sprite_set_url(@sprite_set), notice: "Sprite set was successfully created." }
        format.json { render :show, status: :created, location: @sprite_set }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sprite_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprite_sets/1 or /sprite_sets/1.json
  def update
    respond_to do |format|
      if @sprite_set.update(sprite_set_params)
        format.html { redirect_to sprite_set_url(@sprite_set), notice: "Sprite set was successfully updated." }
        format.json { render :show, status: :ok, location: @sprite_set }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sprite_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprite_sets/1 or /sprite_sets/1.json
  def destroy
    @sprite_set.destroy

    respond_to do |format|
      format.html { redirect_to sprite_sets_url, notice: "Sprite set was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sprite_set
      @sprite_set = SpriteSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sprite_set_params
      params.require(:sprite_set).permit(:sprites_on_id, :sprites_on_type, :back_default, :back_female, :back_shiny, :back_shiny_female, :front_default, :front_female, :front_shiny, :front_shiny_female)
    end
end
