FactoryBot.define do
  factory :user do
    nickname               {Faker::Name.initials(number: 5)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6) + '1y'}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    birthday              {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
  end
end