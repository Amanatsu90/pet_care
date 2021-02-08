FactoryBot.define do
  factory :post do
    title       { Faker::Lorem.sentence(word_count: 3) }
    text        { Faker::Lorem.paragraph(sentence_count: 2) }
    dog_size_id { Faker::Number.between(from: 1, to: 3) }
    theme_id    { Faker::Number.between(from: 1, to: 11) }
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
