FactoryBot.define do
  factory :space do
    id { Faker::Number.unique.number(digits: 10) }
    name { "a name" }
    color { "a color" }
    tags_enabled { true }
    hidden { false }
  end
end
