require 'rails_helper'

describe Activity, type: :model do

  it 'is valid with a name' do
    activity = Activity.new(name: "runjumping")
    expect(activity).to be_valid
  end
  it 'is invalid without a name' do
    activity = Activity.new
    activity.valid?
    expect(activity.errors[:name]).to include("can't be blank")
  end
end
