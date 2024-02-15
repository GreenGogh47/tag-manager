class SpaceMember < ApplicationRecord
  belongs_to :space
  belongs_to :member
end
