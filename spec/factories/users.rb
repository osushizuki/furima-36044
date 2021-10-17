FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {'20000101'}
    first_name            {'ミホン'}
    last_name             {'ミホン'}
    first_name_kanji      {'見本'}
    last_name_kanji       {'見本'}
  end
end