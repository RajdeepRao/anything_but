class NeighborhoodsController < ApplicationController


  def create
    neighborhood = Neighborhood.create(:name => 'apiData.name')
   
  end




end
