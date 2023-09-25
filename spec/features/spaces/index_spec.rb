require "rails_helper"

RSpec.describe "Spaces Index Page" do
  it "displays all spaces" do
    visit "/spaces"
    expect(page).to have_content("Spaces")

    expect(page).to have_content("Name")
    expect(page).to have_content("Personal")

    expect(page).to have_content("ID")
    expect(page).to have_content(ENV["MY_FIRST_SPACE_ID"])

    expect(page).to have_content("Statuses")
    expect(page).to have_content("Open")
    expect(page).to have_content("in progress")
    expect(page).to have_content("roadblock")
    expect(page).to have_content("complete")

    expect(page).to have_content("Members")
    expect(page).to have_content("Christopher Crane")
  end
end