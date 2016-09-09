class RecommendationsController < ApplicationController

  def create
    yelp = Adapter::YelpWrapper.new
    places = yelp.get_places
    yelp.parse_and_save_places(places)
    etc.
    #activities_collection = initiate_api_req(params["latitude"], params["longitude"])


    ## params includes params["latitude"] which returns a STRING of the latitude, params ["longitude"] which reutrns a STRING of the longitude, and params["doNotWant"] which returns a STRING of whatever was specified in the form on the welcome page. It is not clear if we need to create strong params for this...
  end

  def show

  end

end
