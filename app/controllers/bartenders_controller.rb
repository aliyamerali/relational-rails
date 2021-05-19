class BartendersController < ApplicationController
  def index
    if params[:count] == "drinks"
      @bartenders = Bartender.number_of_bartender_drinks
    else
      @bartenders = Bartender.most_recently_created
    end
  end

  def show
    @bartender = Bartender.find(params[:id])
  end

  def new
  end

  def create
    bartender = Bartender.create!(bartender_params)
    redirect_to '/bartenders'
  end

  def edit
    @bartender = Bartender.find(params[:id])
  end

  def update
    bartender = Bartender.find(params[:id])
    bartender.update(bartender_params)

    bartender.save
    redirect_to "/bartenders/#{bartender.id}"
  end

  def destroy
    bartender = Bartender.find(params[:id])
    bartender.destroy
    redirect_to "/bartenders"
  end

  private
  def bartender_params
    params.permit(:name, :age, :on_vacation, :city)
  end
end
