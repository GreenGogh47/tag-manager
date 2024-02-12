class Tag < ApplicationRecord
  validates_presence_of :name,
                        :space_id,
                        :tag_fg,
                        :tag_bg,
                        :creator
  
  belongs_to :space
end