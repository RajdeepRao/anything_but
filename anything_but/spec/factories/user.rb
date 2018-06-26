FactoryGirl.define do
  factory :user do
    name {Faker::Name.name}
    password "123"
  end
end
