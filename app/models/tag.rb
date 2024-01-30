class Tag < ApplicationRecord
  validates_presence_of :name,
                        :space_id,
                        :tag_fg,
                        :tag_bg,
                        :creator
  
  belongs_to :space

  def self.shared_tags
    joins(:space)
      .where.not(spaces: { id: nil })
      .group(:name, :tag_bg)
      .having('COUNT(spaces.id) = ?', Space.count)
  end

  def self.unique_tags
    joins(:space)
      .where.not(spaces: { id: nil })
      .group(:name, :tag_bg)
      .having('COUNT(spaces.id) < ?', Space.count)
  end
end