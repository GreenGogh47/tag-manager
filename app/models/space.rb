class Space < ApplicationRecord
  validates_presence_of :id,
                        :name,
                        :color,
                        :hidden,
                        :tags_enabled

  has_many :statuses
  has_many :tags
  has_many :space_members
  has_many :members, through: :space_members
end