FactoryBot.define do
  factory :purchase_address do
    postal_code   { '123-4567' }
    prefecture_id { '1' }
    municipality  { '横浜市緑区' }
    address       { '青山1-1-1' }
    building_name { '柳ビル' }
    phone_number  { '12345678910' }
    token         { "tok_abcdefghijk00000000000000000" }
  end
end
