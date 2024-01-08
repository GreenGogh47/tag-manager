require "rails_helper"

RSpec.describe TeamService do
  describe '#my_team_id' do
    let(:team_service) { TeamService.new }

    context 'when the API request is successful' do
      it 'returns the team ID' do
        VCR.use_cassette('team_service/successful_request') do
          expect(team_service.my_team_id).to eq(ENV["MY_TEAM_ID"])
        end
      end

      it 'caches the team ID' do
        VCR.use_cassette('team_service/successful_request') do
          expect(team_service).to receive(:get_url).once.and_call_original
          team_service.my_team_id
          team_service.my_team_id
        end
      end
    end

    context 'when the API request fails' do
      xit 'raises an error' do
        VCR.use_cassette('team_service/failed_request') do
          expect { team_service.my_team_id }.to raise_error(TeamService::ApiError, /Failed to retrieve team ID from API:/)
        end
      end
    end
  end
end