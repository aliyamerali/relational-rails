class BartenderDrinksController < ApplicationController
  def index
    @bartender = Bartender.find(params[:id])
    @drinks = @bartender.drinks
  end
end
