require "rails_helper"

RSpec.describe TagsService do
  describe "instance methods" do
    describe "#get_tags" do
      it "retrieves all tags" do
        VCR.use_cassette("tags_service") do
          data = TagsService.new.get_tags(ENV["MY_FIRST_SPACE_ID"])
          expect(data).to be_a(Hash)

          tags = data[:tags]
          expect(tags).to be_an(Array)
          expect(tags.first).to have_key(:name)
          expect(tags.first).to have_key(:project_id)
          expect(tags.first).to have_key(:tag_fg)
          expect(tags.first).to have_key(:tag_bg)
          expect(tags.first).to have_key(:creator)
        end
      end
    end
  end
end
