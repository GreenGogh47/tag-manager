FactoryBot.define do
  factory :space do
    id { Faker::Number.unique.number(digits: 10) }
    name { "a name" }
    color { "a color" }
    tags_enabled { true }
    hidden { "Public" }
  end
end
