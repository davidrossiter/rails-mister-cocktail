class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [ :show ]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new
    #We need to add a @dose = Dose.new because otherwise we don't know what Dose is inside the cocktail show page. Dose will be undefined and nil
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
