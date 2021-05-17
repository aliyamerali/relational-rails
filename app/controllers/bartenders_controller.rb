class BartendersController < ApplicationController
  def index
    @bartenders = Bartender.most_recently_created
  end

  def show
    @bartender = Bartender.find(params[:id])
  end

  def new
  end

  def create
    bartender = Bartender.new(bartender_params)

    bartender.save
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

  private
  def bartender_params
    params.permit(:name, :age, :on_vacation, :city)
  end
end
