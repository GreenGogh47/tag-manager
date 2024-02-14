require "rails_helper"

RSpec.describe Space, type: :model do
  before(:context) do
    @space1 = FactoryBot.create(:space)
    @space2 = FactoryBot.create(:space)
    
    @tag1 = FactoryBot.create(:tag, space: @space1, name: "shared 1")
    @tag2 = FactoryBot.create(:tag, space: @space2, name: "shared 1")
    @tag3 = FactoryBot.create(:tag, space: @space1, name: "unique 1")
    @tag4 = FactoryBot.create(:tag, space: @space2, name: "unique 2")
  end
  
  after(:context) do
    SpaceMember.destroy_all
    Member.destroy_all
    Tag.destroy_all
    Status.destroy_all
    Space.destroy_all
  end

  describe "attributes" do
    it { should validate_presence_of(:id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    # "private" is a reserved word
    it { should validate_presence_of(:tags_enabled) }
  end

  describe "associations" do
    it { should have_many(:statuses) }
    it { should have_many(:members) }
    it { should have_many(:tags) }
  end

  describe "model methods" do
    it "::global_tags" do
      expect(Space.global_tags.count).to eq(2)
      expect(Space.global_tags).to include(@tag1, @tag2)
    end
  end

  describe "instance methods" do
    it "#non_global_tags" do
      expect(@space1.non_global_tags.count).to eq(1)
      expect(@space1.non_global_tags).to include(@tag3)
    end
  end
end