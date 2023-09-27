require "rails_helper"

RSpec.describe BaseService do
  describe "initial connection" do
    it "can connect to the ClickUp API" do
      VCR.use_cassette("base_service") do
        base_service = BaseService.new
        expect(base_service).to be_a(BaseService)
      end
    end
  end
end
