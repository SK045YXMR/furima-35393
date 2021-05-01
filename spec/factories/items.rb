FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.word }
    item_example { Faker::Lorem.sentence }
    item_category_id { Faker::Number.within(range: 1..11) }
    item_status_id { Faker::Number.within(range: 1..7) }
    shopping_charges_id { Faker::Number.within(range: 1..3) }
    shipping_area_id { Faker::Number.within(range: 1..48) }
    days_to_ship_id { Faker::Number.within(range: 1..4) }
    price { 10000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
