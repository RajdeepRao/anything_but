class Adapter <ApplicationRecord
# require 'rest-client' don't we need this gem for api requests? or does
#yelp api gem take care of it?

  def initiate_api_req
    #makes the api request
    the_api_call = Yelp.client.search("#{@city}", {neighborhood: @neighborhood, activity: @activity })
    api_call_string = JSON.parse(the_api_call)
    parsed_request = api_call_string["???"].find { |data| data["???"] == ??? }
    #parses the json string but do we need it to if its already whittled down
    #to city and neighborhood?
    parsed_request.save_api_objects

  end

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
