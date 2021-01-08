FactoryBot.define do
  factory :address_order do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '横浜市緑区' }
    house_number { '青山1-1-1' }
    phone_number { Faker::Number.number(digits: 11) }
    user_id { Faker::Number.between(from: 1, to: 1000) }
    item_id { Faker::Number.between(from: 1, to: 1000) }
  end
end 