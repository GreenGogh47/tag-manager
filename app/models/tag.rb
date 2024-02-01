class Tag < ApplicationRecord
  validates_presence_of :name,
                        :space_id,
                        :tag_fg,
                        :tag_bg,
                        :creator
  
  belongs_to :space

  # scope :shared_tags, ->(name, bg_color) { where(name: name, tag_bg: bg_color) }
end