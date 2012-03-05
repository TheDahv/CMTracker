require 'faker'

FactoryGirl.define do
  factory :volunteer do
    first_name 'Test'
    last_name 'Volunteer'
    email 'test@cmtracker.org'
    password 'zeh-password'
    password_confirmation 'zeh-password'
    admin true
  end

  factory :classroom do
    name 'Classroom'
  end

  factory :child do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
  end

  factory :service do
    service_date Date.today
  end

  factory :attendance do
  end
end
