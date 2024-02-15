class Member < ApplicationRecord
  validates_presence_of :id,
                        :username,
                        :color,
                        :profile_picture,
                        :initials

  has_many :space_members
  has_many :spaces, through: :space_members
end