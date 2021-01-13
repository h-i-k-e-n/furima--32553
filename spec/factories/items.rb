FactoryBot.define do
  factory :item do
    association :user,factory: :user 

title              {Faker::Name}
text               {Faker::Name.initials(number: 2)}
category_id        {}
state_id           {}
address_id         {}
delivery_charge_id {}
delivery_day_id    {}
price              {2000}    

end
end
