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
end
