require "rails_helper"

RSpec.describe Member do
  describe "attributes" do
    it "has an id, username, color, profile picture, and initials" do
      member = Member.new({
                            user: { id: 66_176_739, username: "Christopher Crane", color: "#d60800",
                                    profilePicture: "https://attachments.clickup.com/profilePictures/66176739_QbA.jpg", initials: "CC" }
                          })

      expect(member).to be_a(Member)
      expect(member.id).to eq(66_176_739)
      expect(member.username).to eq("Christopher Crane")
      expect(member.color).to eq("#d60800")
      expect(member.profile_picture).to eq("https://attachments.clickup.com/profilePictures/66176739_QbA.jpg")
      expect(member.initials).to eq("CC")
    end
  end
end