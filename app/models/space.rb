class Space < ApplicationRecord
  validates_presence_of :id,
                        :name,
                        :color,
                        :tags_enabled

validates :hidden, inclusion: { in: [true, false] }, allow_nil: true

  has_many :statuses
  has_many :tags
  has_many :space_members
  has_many :members, through: :space_members

  def self.global_tags
    space_count = Space.count

    matching_tags = Tag.joins(:space)
                      .where("(tags.name, tags.tag_bg) IN (
                              SELECT name, tag_bg
                              FROM tags
                              GROUP BY name, tag_bg
                              HAVING COUNT(*) = ?
                            )", space_count)
  end

  def non_global_tags
    Space.global_tags.present? ? tags.where.not(id: Space.global_tags.pluck(:id)) : tags
  end  
end