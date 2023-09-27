require "rails_helper"

RSpec.describe Tags do
  before(:each) do
    data = {
      :name=>"jami",
      :project_id=>"90090228842",
      :tag_fg=>"#800000",
      :tag_bg=>"#7C4DFF",
      :creator=>66176739
    }

    @tag = Tags.new(data)
  end

  it "has attributes" do
    expect(@tag.name).to eq("jami")
    expect(@tag.project_id).to eq("90090228842")
    expect(@tag.tag_fg).to eq("#800000")
    expect(@tag.tag_bg).to eq("#7C4DFF")
    expect(@tag.creator).to eq(66176739)
  end
end