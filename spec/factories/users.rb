FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'やマ田' }
    first_name            { 'たロ宇' }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'タロウ' }
    birthday              { '2000-01-01' }
  end
end
