require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:space_id) }
    it { should validate_presence_of(:tag_fg) }
    it { should validate_presence_of(:tag_bg) }
    it { should validate_presence_of(:creator) }
  end

  describe "associations" do
    it { should belong_to(:space) }
  end

  describe "shared_tags scope" do
    let!(:space1) { Space.create(id: 1, name: "space 1", color: "blue", hidden: false, tags_enabled: true) }
    let!(:space2) { Space.create(id: 2, name: "space 2", color: "blue", hidden: false, tags_enabled: true) }

    let!(:tag1) { Tag.create(name: "shared 1", space_id: 1, tag_fg: "blue", tag_bg: "blue", creator: "me") }
    let!(:tag2) { Tag.create(name: "shared 1", space_id: 2, tag_fg: "blue", tag_bg: "blue", creator: "me") }
    let!(:tag3) { Tag.create(name: "unique 1", space_id: 1, tag_fg: "blue", tag_bg: "blue", creator: "me") }
    let!(:tag4) { Tag.create(name: "unique 2", space_id: 2, tag_fg: "blue", tag_bg: "blue", creator: "me") }

    it "returns tags that are shared across all spaces" do
      expect(space1.all_spaces_have_tag?(tag1.name, tag1.tag_bg)).to eq(true)
      expect(space2.all_spaces_have_tag?(tag2.name, tag2.tag_bg)).to eq(true)
      expect(space1.all_spaces_have_tag?(tag3.name, tag3.tag_bg)).to eq(false)
      expect(space1.all_spaces_have_tag?(tag4.name, tag4.tag_bg)).to eq(false)
    end
  end
end