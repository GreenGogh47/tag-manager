require "rails_helper"

RSpec.describe SpacesService do
  describe "instance methods" do
    describe "#get_spaces" do
      it "retrieves all spaces" do
        VCR.use_cassette("spaces_service") do
          # Test uses my personal team_id
          spaces = SpacesService.new.get_spaces(ENV["MY_TEAM_ID"])
          expect(spaces).to be_a(Hash)

          first_space = spaces[:spaces].first

          expect(first_space[:id]).to eq(ENV["MY_SPACE_ID"])
        end
      end
    end
  end
end
