FactoryBot.define do
  factory :item do
    name                      {Faker::Name.initials}
    explanation               {Faker::Lorem.sentence}
    category_id               {2}
    status_id                 {2}
    shipping_source_id        {2}
    area_id                   {2}
    mailing_date_id           {2}
    price                     {Faker::Bank.account_number(digits: 5)}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
