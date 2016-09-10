class RecommendationsController < ApplicationController

  def create
    yelp = Adapter::YelpWrapper.new
    recommendation_array = yelp.initiate_api_req(params["latitude"], params["longitude"], yelp.categories)
    filtered = yelp.filter_api(recommendation_array, params['doNotWant']) #the filtered array of rec objects


    #takes the massive array of recommendation objects from the API and
    #creates new Recommendation instances to populate our DB with each rec
    filtered.each do |one_rec|
      recommendation = Recommendation.create(name:one_rec.name, url: one_rec.url)
    end

    #can we combine this into lines 11-13? and/or somehow have this happen
    #in the neighborhood controller and pull from there so we get neighborhood_id?
    filtered.each do |location|
      rec=Recommendation.create(name:location.name, url:location.url)
      rec.save
    end

    #we could theoretically make line 16 through 21 wrapped inside a SQL method?
    @recommendation=Recommendation.all.sample
        respond_to do |f|
          f.json {
            render json: {name:@recommendation.name, url:@recommendation.url}
          }
          # render: 'activities/i_hate_that'
        end


  end


  def show
  end




end
