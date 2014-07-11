
FactoryGirl.define do
  factory :user do
    name     'John Doe'
    email    'john.doe@acme.com'
    password 'foobar'
    password_confirmation 'foobar'

    trait :with_empty_password do
      password ' '
      password_confirmation ' '
    end

  end
end