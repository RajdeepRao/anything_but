require 'yelp'

class Adapter < ApplicationRecord


  client = Yelp::Client.new({ consumer_key: "hCTaBcVlgZ17kGVkIkjxKg",
                              consumer_secret: "sIjr5P755ai8DaEE-2oEtRWSpm8",
                              token: "qCUzEyLgA_XmZl0wxSVvRkjXBfFRgisr",
                              token_secret: "m-QKLTpR9QopbhUQRU_6R2sorFA"
                            })

  def initiate_api_req (latitude_num, longitude_num)
    coordinates = {latitude: latitude_num, longitude: longitude_num}
    params = {term: 'no food'}
    client.search_by_coordinates(coordinates, params)
  end


  # def initiate_api_req
  #   #makes the api request
  #   the_api_call = client.search("#{@city}", {neighborhood: @neighborhood, activity: @activity })
  #   api_call_string = JSON.parse(the_api_call)
  #   parsed_request = api_call_string["???"].find { |data| data["???"] == ??? }
  #   #parses the json string but do we need it to if its already whittled down
  #   #to city and neighborhood?
  #   parsed_request.save_api_objects
  #
  # end

  def save_api_objects
    #takaes parsed_request and save each result as an object hash
    #within an array
    #store as reccomendations array

  end

  def filter_api
    #filters the recommendations array based on the 'dislikes' of the user
  end

  def machete
    #if we need to hack away things like food, gym, and medical things
    #from the api request
  end


end
