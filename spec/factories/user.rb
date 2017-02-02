FactoryGirl.define do
  factory :user do
    first_name 'John'
    last_name  'Doe'
    email 'tester@tester.com'
    password '123456'
    confirmed_at DateTime.current
  end
end
