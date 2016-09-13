class RecommendationsController < ApplicationController


## CREATE VARIABLES FOR PREVIOUS SEARCH AND FILTERED!!!

  def create
    yelp = Adapter::YelpWrapper.new


    if Recommendation.previous_search == false
      recommendation_array = yelp.initiate_api_req(params["latitude"], params["longitude"], yelp.categories)
      Recommendation.previous_search = true
      recommendation_array.flatten!.each do |one_rec|
        unless Recommendation.find_by(name: one_rec.name)
          rec=Recommendation.new(name:one_rec.name, url:one_rec.url)
          one_rec.categories.each do |category_array|
            if Activity.all.any?{|activity|activity.name==category_array[0]}
              rec.activities<<Activity.find_by(name:category_array[0])
              rec.save
            end
          end
        end
      end
    end

    Recommendation.filtered_array=(yelp.filter_api(Recommendation.all, params['doNotWant'])) #the filtered array of rec objects


    #we could theoretically make line 16 through 21 wrapped inside a SQL method?
    # binding.pry
    recommendation=Recommendation.filtered_array.sample
        respond_to do |f|
          f.json {
            render json: {name:recommendation.name, url:recommendation.url}
          }
        end
  end


  def show
    ## NEED TO FIND A WAY TO GIVE SHOW ACCESS TO THE FILTERED ARRAY.
    recommendation=Recommendation.filtered_array.sample
    respond_to do |f|
      f.json {
        render json: {name:recommendation.name, url:recommendation.url}
      }
    end
  end

  def add_user_liked_activity
    rec = Recommendation.find_by(url:params[:like_business_link])
    unless current_user.recommendations.any?{|recommendation| recommendation.url == rec.url}
      current_user.recommendations << rec
    end
  end



end
