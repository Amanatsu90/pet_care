FactoryBot.define do
  factory :user do
    name                  {Faker::Name.name}
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end