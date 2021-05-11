class BartendersController < ApplicationController
  def index
    @bartenders = Bartender.most_recently_created
  end

  def show
    @bartender = Bartender.find(params[:id])
  end
end
