class DrinksController < ApplicationController
  def index
    if params[:filter]
      @drinks = Drink.filter_drinks(params[:filter])
    elsif params[:partial_filter]
      @drinks = Drink.partial_filter(params[:partial_filter])
    else
      @drinks = Drink.all.popular_drink
    end
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

  def destroy
    drink = Drink.find(params[:id])
    drink.destroy
    redirect_to "/drinks"
  end

  private
  def drink_params
    params.permit(:name, :cost, :abv, :popular)
  end
end
