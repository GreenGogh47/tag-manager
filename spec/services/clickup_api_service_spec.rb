# rubocop:disable Metrics/BlockLength
require "rails_helper"

RSpec.describe ClickupApiService do
  describe "initial connection" do
    it "can connect to the ClickUp API" do
      VCR.use_cassette("clickup_api_service/base_connection") do
        clickup_service = ClickupApiService.new
        expect(clickup_service).to be_a(ClickupApiService)
      end
    end
  end

  describe "#my_team_id" do
    let(:clickup_service) { ClickupApiService.new }

    context "when the API request is successful" do
      it "returns the team ID" do
        VCR.use_cassette("clickup_api_service/my_team_id") do
          expect(clickup_service.my_team_id).to eq(ENV["MY_TEAM_ID"])
        end
      end

      it "caches the team ID" do
        VCR.use_cassette("clickup_api_service/my_team_id") do
          expect(clickup_service).to receive(:get_url).once.and_call_original
          clickup_service.my_team_id
          clickup_service.my_team_id
        end
      end
    end

    context "when the API request fails" do
      xit "raises an error" do
        VCR.use_cassette("clickup_api_service/failed_request") do
          expect do
            clickup_service.my_team_id
          end.to raise_error(ClickupApiService::ApiError, /Failed to retrieve team ID from API:/)
        end
      end
    end
  end

  describe "#get_spaces" do
    let(:clickup_service) { ClickupApiService.new }

    it "retrieves spaces for a given team ID" do
      VCR.use_cassette("clickup_api_service/get_spaces") do
        team_id = ENV["MY_TEAM_ID"]
        spaces = clickup_service.get_spaces(team_id)
        expect(spaces).to be_a(Hash)

        first_space = spaces[:spaces].first
        expect(first_space[:id]).to eq(ENV["MY_SPACE_ID"])
      end
    end
  end

  describe "#get_tags" do
    let(:clickup_service) { ClickupApiService.new }

    it "retrieves tags for a given space ID" do
      VCR.use_cassette("clickup_api_service/get_tags") do
        space_id = ENV["MY_SPACE_ID"]
        tags = clickup_service.get_tags(space_id)
        expect(tags).to be_a(Hash)

        tags_data = tags[:tags]
        expect(tags_data).to be_an(Array)
        expect(tags_data.first).to have_key(:name)
        expect(tags_data.first).to have_key(:project_id) # Convert to "space_id for clarity"
        expect(tags_data.first).to have_key(:tag_fg)
        expect(tags_data.first).to have_key(:tag_bg)
        expect(tags_data.first).to have_key(:creator)
      end
    end
  end
end
