require 'rails_helper'
require 'capybara/rails'
require 'spec_helper'
require 'vcr'

describe Adapter, type: :model do
#tests API response GIVEN working Long & Lat
  let(:client){Adapter::YelpWrapper.new}

  rec1 = Recommendation.create(name: 'Cool Bar')
  rec2 = Recommendation.create(name: 'Enriching Museum')
  rec3 = Recommendation.create(name: 'Nice Park')

  activity1 = Activity.create(name: 'Bar')
  activity2 = Activity.create(name: 'Museum')
  activity3 = Activity.create(name: 'Park')

  rec1.activities << activity1
  rec2.activities << activity2
  rec3.activities << activity3


  it 'returns an array of nearby businesses of pre-approved categories when given longitude and latitude' do
    VCR.use_cassette('yelp/initiate_api_request') do
      test_rec_array=client.initiate_api_req(40.7, -74, client.categories)
      expect(test_rec_array).not_to be_empty
    end
  end
  it 'returns a filtered array of recommendations based on user input term' do
    test_array = [rec1, rec2, rec3]
    search_term = activity2.name
    test_adapter_output = client.filter_api(test_array, search_term)
    expect(test_adapter_output).not_to include(rec2)
  end

end
