class DosesController < ApplicationController
  # def new
  #   @dose = Dose.new
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  def create
    @dose = Dose.new(params_dose)
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.ingredient = @ingredient
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    #we need to find the dose and it's id to know which one we delete
    cocktail = dose.cocktail
    dose.destroy
    #delee that dose that re got using find and the id
    redirect_to cocktail_path(cocktail)
    # redirect to the cocktail page, passing cocktail as an argument otherwise we don't know which cocktail to go bakc to!
  end

  private

  def params_dose
    params.require(:dose).permit(:description)
  end
end
