class RecommendationsController < ApplicationController

  def create
    yelp = Adapter::YelpWrapper.new
    recommendation_array = yelp.initiate_api_req(params["latitude"], params["longitude"], yelp.categories)
    filtered = yelp.filter_api(recommendation_array, params['doNotWant'])

    filtered.each do |location|
      rec=Recommendation.create(name:location.name, url:location.url)
      rec.save
    end

    @recommendation=Recommendation.all.sample

    respond_to do |f|
      f.json {
        render json: {name:@recommendation.name, url:@recommendation.url}
      }
    end
  end


  def show

  end

end
