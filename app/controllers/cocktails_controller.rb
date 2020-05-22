class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail) # we want to show the cocktail we've just created
    else
      render "new" # it's going to reload create new cocktail with a new
    end
  end

  private

  # just the name
  def cocktail_params
    params.require(:cocktail).permit(:name)
  end
end
