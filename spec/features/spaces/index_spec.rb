require "rails_helper"

RSpec.describe "Spaces Index Page" do
  it "displays all spaces" do
    VCR.use_cassette("spaces_index") do
      visit "/spaces"
      expect(page).to have_content("Personal") # Name of the space

      # expect(page).to have_content("Statuses")
      # expect(page).to have_content("Open")
      # expect(page).to have_content("in progress")
      # expect(page).to have_content("roadblock")
      # expect(page).to have_content("complete")
      expect(page).to have_content("Members")
      expect(page).to have_content("Christopher Crane")

      save_and_open_page

      expect(page).to have_content("Tags")
      expect(page).to have_content("jami")
    end
  end
end