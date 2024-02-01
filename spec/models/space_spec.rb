require "rails_helper"

RSpec.describe Space, type: :model do
  before(:each) do
    Tag.destroy_all
    Space.destroy_all

    @space1 = Space.create!(id: 1, name: "space 1", color: "blue", hidden: true, tags_enabled: true)
    @space2 = Space.create!(id: 2, name: "space 2", color: "blue", hidden: true, tags_enabled: true)

    @tag1 = Tag.create!(name: "shared 1", space_id: 1, tag_fg: "blue", tag_bg: "blue", creator: "me")
    @tag2 = Tag.create!(name: "shared 1", space_id: 2, tag_fg: "blue", tag_bg: "blue", creator: "me")
    @tag3 = Tag.create!(name: "unique 1", space_id: 1, tag_fg: "blue", tag_bg: "blue", creator: "me")
    @tag4 = Tag.create!(name: "unique 2", space_id: 2, tag_fg: "blue", tag_bg: "blue", creator: "me")
  end

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
    it "::shared_tags" do
      expect(Space.shared_tags).to be_an(Array)
      expect(Space.shared_tags.first).to be_a(OpenStruct)
      expect(Space.shared_tags.first.name).to eq("shared 1")
    end
  end
end