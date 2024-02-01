class Space < ApplicationRecord
  validates_presence_of :id,
                        :name,
                        :color,
                        :tags_enabled,
                        :hidden

validates :hidden, inclusion: { in: [true, false] }, allow_nil: true


  has_many :statuses
  has_many :tags
  has_many :space_members
  has_many :members, through: :space_members

  def self.shared_tags
    tags = Tag.select("name, tag_bg")
      .group(:name, :tag_bg)
      .having("COUNT(DISTINCT space_id) = #{Space.distinct.count}")

    tags.map do |tag|
      OpenStruct.new(
        name: tag.name,
        tag_bg: tag.tag_bg
      )
    end
  end
end