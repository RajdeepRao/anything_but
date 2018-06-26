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
    end



    def initiate_api_req (latitude_num, longitude_num, categories)
      yelp_query_array = []
      coordinates = {latitude: latitude_num, longitude: longitude_num}
      categories.each do |category|
        params = {category_filter: category}
        yelp_query_array << self.client.search_by_coordinates(coordinates, params).businesses
      end
      yelp_query_array
    end

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
