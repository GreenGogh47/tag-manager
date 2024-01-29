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
end
