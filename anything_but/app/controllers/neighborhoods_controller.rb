class NeighborhoodsController < ApplicationController


  def create
    neighborhood = Neighborhood.create(:name => 'apiData.name')
    #i have not parsed the AJAX well enough to know where/how the actual name of the
    #neighborhood is being stored
  end




end
