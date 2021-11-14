FactoryBot.define do
  factory :order_consumer do
    postal_code           {'123-4567'}
    prefecture_id         {2}
    city                  {'横浜'}
    address               {'1-1'}
    building              {'テスト'}
    phone_number          {Faker::Number.number(11)}
    token                 {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item

  end
end
