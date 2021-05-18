class DrinksController < ApplicationController
  def index
    @drinks = Drink.all
  end

  def show
    @drink = Drink.find(params[:id])
  end

  def edit
    @drink = Drink.find(params[:id])
  end

  def update
    drink = Drink.find(params[:id])
    drink.update(drink_params)

    drink.save
    redirect_to "/drinks/#{drink.id}"
  end

  private
  def drink_params
    params.permit(:name, :cost, :abv, :popular)
  end
end
