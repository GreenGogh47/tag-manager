require "rails_helper"

RSpec.describe Status do
  describe "attributes" do
    it "has an id, status, type, orderindex, and color" do
      status = Status.new({
                            id: "p90090228842_u4kv1Iu6",
                            status: "Open",
                            type: "open",
                            orderindex: 0,
                            color: "#d3d3d3"
                          })

      expect(status).to be_a(Status)
      expect(status.id).to eq("p90090228842_u4kv1Iu6")
      expect(status.name).to eq("Open")
      expect(status.type).to eq("open")
      expect(status.orderindex).to eq(0)
      expect(status.color).to eq("#d3d3d3")
    end
  end
end