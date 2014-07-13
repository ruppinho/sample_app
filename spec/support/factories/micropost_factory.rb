FactoryGirl.define do
  factory :micropost do
    content { Faker::Lorem.paragraph([*(1..3)].sample)[1..140].length }
    user
  end
end
