FactoryBot.define do
  factory :item do
    product_name        { Faker::Name.initials(number: 2) }
    product_description { Faker::Lorem.sentence }
    category_id         { '2' }
    product_status_id   { '2' }
    shipping_charge_id  { '2' }
    prefecture_id       { '2' }
    day_to_ship_id      { '2' }
    price               { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end