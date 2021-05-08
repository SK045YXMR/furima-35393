FactoryBot.define do
  factory :purchase_order do 
    token             { "tok_abcdefghijk00000000000000000" }
    postal_code       { '123-4567' }
    shipping_area_id  { Faker::Number.within(range: 2..48) }
    city              { '東京都' }
    address           { '千代田区' }
    building_name     { 'testhouse1-1' }
    phone_number      { '09012345678' }
  end
end