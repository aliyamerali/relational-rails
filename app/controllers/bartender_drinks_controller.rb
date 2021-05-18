class BartenderDrinksController < ApplicationController
  def index
    @bartender = Bartender.find(params[:id])
    @drinks = @bartender.drinks
  end

  def new
    @bartender = Bartender.find(params[:id])
  end

  def create
    bartender = Bartender.find(params[:id])
    drink = bartender.drinks.create!(drink_params)

    redirect_to "/bartenders/#{bartender.id}/drinks"
  end

  private
  def drink_params
    params.permit(:name, :cost, :abv, :popular)
  end
end
