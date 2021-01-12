FactoryBot.define do
  factory :item do

title              {Faker::Name}
text               {Faker::Name.initials(number: 2)}
category_id        {2}
state_id           {2}
address_id         {2}
delivery_charge_id {2}
delivery_day_id    {2}
user_id            {2}
price              {2000}    

end
end