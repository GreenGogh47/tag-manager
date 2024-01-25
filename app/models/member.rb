class Member < ApplicationRecord
  validates_presence_of :id,
                        :c_id,
                        :username,
                        :color,
                        :profile_picture,
                        :initials

  belongs_to :space
end