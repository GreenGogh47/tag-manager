require "rails_helper"

RSpec.describe Space, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:hidden) } # "private" is a reserved word
    it { should validate_presence_of(:tags_enabled) }
  end

  describe "associations" do
    it { should have_many(:statuses) }
    it { should have_many(:members) }
    it { should have_many(:tags) }
  end
end