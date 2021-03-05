class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def new
    @cocktail = Cocktail.new # needed to instantiate the form_for
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)

    # we need `restaurant_id` to associate cocktail with corresponding restaurant
    # @restaurant = Restaurant.find(params[:restaurant_id])
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
