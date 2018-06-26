class CitiesController < ApplicationController

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @neighborhoods = Neighborhoods.all
  end


  private

  def set_city
    @city = City.find(params[:id])
  end

end
