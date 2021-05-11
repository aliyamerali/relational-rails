class BartendersController < ApplicationController
  def index
    @bartenders = Bartender.all
  end
end
