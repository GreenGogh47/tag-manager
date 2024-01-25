class Space < ApplicationRecord
  has_many :statuses
  has_many :tags
  has_many :space_members
  has_many :members, through: :space_members
end