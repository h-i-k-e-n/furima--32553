FactoryBot.define do
  factory :order_consumer do
    postal_code              { '876-0987' }
    address_id                { '2'}
    city                    {'高山市'}
    address                 { '児玉3-2' }
    building_name            {'' }
    tel_number            {'09087654321'}
    token                    { 'lp'}
  end
end
