require 'rails_helper'

RSpec.describe Space, type: :model do
  describe "attributes" do
    # it { should validate_presence_of(:name) }
    
  end
  
  describe "associations" do
    it { should have_many(:statuses) }
    it { should have_many(:members) }
    it { should have_many(:tags) }
  end
end