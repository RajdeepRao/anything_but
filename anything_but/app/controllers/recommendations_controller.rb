class RecommendationsController < ApplicationController

  def create
    yelp = Adapter::YelpWrapper.new
    recommendation_array = yelp.initiate_api_req(params["latitude"], params["longitude"], yelp.categories)
    filtered = yelp.filter_api(recommendation_array, params['doNotWant'])


  end


  def show

  end

end
