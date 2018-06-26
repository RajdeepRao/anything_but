require 'yelp'
class Adapter

  class YelpWrapper
    attr_reader :client, :categories

    def initialize
      @client = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                                consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                                token: ENV["YELP_TOKEN"],
                                token_secret: ENV["YELP_TOKEN_SECRET"]
                              })
      @categories = ['active', 'arts', 'nightlife']
      #yelp has far too many categories so we only really care about these three categories otherwise too many options
    end


    #called in Recommendations Controller
    def initiate_api_req (latitude_num, longitude_num, categories)
      yelp_query_array = []
      coordinates = {latitude: latitude_num, longitude: longitude_num}  
      categories.each do |category|
        params = {category_filter: category}
        yelp_query_array << self.client.search_by_coordinates(coordinates, params).businesses
        #push to empty array all the businesses from the Yelp API call that match the coordinates give and the category 
      end
      yelp_query_array #all the businesses that are active, considered arts or nightlife that fall within the given coordinates
    end

    #called in Recommendations Controller (doNotWant comes from params of what the user clicked for anything but x)
    def filter_api(recommendations, doNotWant)
      filter_array = []
      recommendations.each do |business|
        if business != nil
          unless business.activities.any?{|activity| activity.name==doNotWant}
            filter_array<<business
          end
        end
      end
        filter_array
    end




      #filters the recommendations array based on the 'dislikes' of th

  end
end
