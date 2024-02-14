require "rails_helper"

RSpec.describe Space, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { is_expected.to validate_presence_of(:hidden) } # "private" is a reserved word
    it { should validate_presence_of(:tags_enabled) }
  end

  describe "associations" do
    it { should have_many(:statuses) }
    it { should have_many(:members) }
    it { should have_many(:tags) }
  end

  describe "model methods" do
    xit "::global_tags" do
      @space1 = Space.create!(id: 999, name: "space 1", color: "blue", hidden: true, tags_enabled: true)
      @space2 = Space.create!(id: 9999, name: "space 2", color: "blue", hidden: true, tags_enabled: true)

      @tag1 = Tag.create!(name: "shared 1", space_id: @space1.id, tag_fg: "blue", tag_bg: "blue", creator: "me")
      @tag2 = Tag.create!(name: "shared 1", space_id: @space2.id, tag_fg: "blue", tag_bg: "blue", creator: "me")
      @tag3 = Tag.create!(name: "unique 1", space_id: @space1.id, tag_fg: "blue", tag_bg: "blue", creator: "me")
      @tag4 = Tag.create!(name: "unique 2", space_id: @space2.id, tag_fg: "blue", tag_bg: "blue", creator: "me")

      require 'pry'; binding.pry

      expect(Space.global_tags.count).to eq(2)
      expect(Space.global_tags).to include(@tag1, @tag2)
    end
  end

  describe "instance methods" do
    xit "#non_global_tags" do
      @space1 = Space.create!(id: 999, name: "space 1", color: "blue", hidden: true, tags_enabled: true)
      @space2 = Space.create!(id: 9999, name: "space 2", color: "blue", hidden: true, tags_enabled: true)

      @tag1 = Tag.create!(name: "shared 1", space_id: @space1.id, tag_fg: "blue", tag_bg: "blue", creator: "me")
      @tag2 = Tag.create!(name: "shared 1", space_id: @space2.id, tag_fg: "blue", tag_bg: "blue", creator: "me")
      @tag3 = Tag.create!(name: "unique 1", space_id: @space1.id, tag_fg: "blue", tag_bg: "blue", creator: "me")
      @tag4 = Tag.create!(name: "unique 2", space_id: @space2.id, tag_fg: "blue", tag_bg: "blue", creator: "me")

      require 'pry'; binding.pry

      expect(@space1.non_global_tags.count).to eq(1)
      expect(@space1.non_global_tags).to include(@tag3)
    end
  end
end