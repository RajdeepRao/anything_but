require 'yelp'
class Adapter

  class YelpWrapper
    attr_reader :client, :categories

    def initialize
      @client = Yelp::Client.new({ consumer_key: "hCTaBcVlgZ17kGVkIkjxKg",
                                consumer_secret: "sIjr5P755ai8DaEE-2oEtRWSpm8",
                                token: "qCUzEyLgA_XmZl0wxSVvRkjXBfFRgisr",
                                token_secret: "m-QKLTpR9QopbhUQRU_6R2sorFA"
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
        unless business.activities.any?{|activity| activity.name==doNotWant}
          filter_array<<business
        end
      end
        filter_array
    end




      #filters the recommendations array based on the 'dislikes' of th

  end
end
