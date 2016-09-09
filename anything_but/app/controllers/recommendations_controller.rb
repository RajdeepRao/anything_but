class RecommendationsController < ApplicationController

  def create
    ## params includes params["latitude"] which returns a STRING of the latitude, params ["longitude"] which reutrns a STRING of the longitude, and params["doNotWant"] which returns a STRING of whatever was specified in the form on the welcome page. It is not clear if we need to create strong params for this...
  end

  def show

  end

end
