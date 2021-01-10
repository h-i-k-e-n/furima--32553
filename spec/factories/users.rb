FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password_confirmation {password}
    birth_date            {Faker::Date.in_date_period}
  end
  
end