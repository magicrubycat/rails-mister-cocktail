class DosesController < ApplicationController
  # create a new and create
  # simple_form

  # 2 methods: create and destroy as we are dependent on a cocktail
  # look for a cocktail first
  # create a dose of an ingredient to that cocktail

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    # I'm assigning a dose to a cocktail and that it's going to be a cocktail
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail) # as we show that specific cocktail - with the id above
    else
      render "cocktails/show" # need to specify cocktails path
    end
  end

  # dose.find for a specific dose
  # then destroy it
  # then redirect to a path
  def destroy
    @dose = Dose.find(params[:id]) # I delete a dose
    @cocktail = @dose.cocktail # we need to define a variable because it's undefined
    @dose.delete
    redirect_to cocktail_path(@cocktail) # go to the show
  end

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
