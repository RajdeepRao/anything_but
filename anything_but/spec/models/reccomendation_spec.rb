require 'rails_helper'

describe Recommendation, type: :model do

  it 'is valid with a name' do
    rec = Recommendation.new(name: "Mario")
    expect(rec).to be_valid
  end
  it 'is invalid without a name' do
    rec = Recommendation.new
    rec.valid?
    expect(rec.errors[:name]).to include("can't be blank")
  end 
end
