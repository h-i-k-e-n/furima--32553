FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    birth_date            { Faker::Date.in_date_period }
    last_name       { '田中' }
    first_name      { 'たかし' }
    last_name_kana  { 'タナカ' }
    first_name_kana { 'タカシ' }

  end
end
