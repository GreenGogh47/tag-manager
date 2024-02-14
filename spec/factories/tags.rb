FactoryBot.define do
  factory :tag do
    name { "A Tag" }
    space_id { "must have a space id" }
    tag_fg { "fg_color" }
    tag_bg { "bg_color" }
    creator { "Chris" }
  end
end
