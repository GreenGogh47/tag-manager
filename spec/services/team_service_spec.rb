require "rails_helper"

RSpec.describe TeamService do
  describe "instance methods" do
    describe "#get_teams" do
      it "retrieves all teams" do
        VCR.use_cassette("team_service") do
          teams = TeamService.new.get_teams

          expect(teams).to be_a(Hash)

          first_team = teams[:teams].first
          expect(first_team).to have_key(:id)
          expect(first_team[:id]).to be_a(String)
          expect(first_team).to have_key(:name)
          expect(first_team[:name]).to be_a(String)
          expect(first_team).to have_key(:color)
          expect(first_team[:color]).to be_a(String)
        end
      end
    end
  end
end