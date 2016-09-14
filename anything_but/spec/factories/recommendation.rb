FactoryGirl.define do
  factory :recommendation do
    name {Faker::Company.name}
    url {"www.#{Faker::Pokemon.name}.com"}
  end
end
