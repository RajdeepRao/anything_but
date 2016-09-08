class CitiesController < ApplicationController

  def index
    @city = City.all
  end

  def show
    @city = City.find_by(id: params[:id])
    @neighborhoods = Neighborhoods.all  # do we actually need this?
  end


  private

  def set_city
    @city = City.find(params[:id])
  end

end
