FactoryGirl.define do
  factory :activity do
    name {Faker::Team.sport}
  end
end
