require 'rails_helper'

RSpec.describe Status, type: :model do
  describe "attributes" do
    it { should validate_presence_of(:name) } # Replacement for "status"
    it { should validate_presence_of(:orderindex) }
    it { should validate_presence_of(:color) }
  end

  describe "associations" do
    it { should belong_to(:space) }
  end
end
