class Space < ApplicationRecord
  validates_presence_of :id,
                        :name,
                        :color,
                        :tags_enabled

  validates :hidden, inclusion: { in: [true, false] }, allow_nil: false

  has_many :statuses
  has_many :tags
  has_many :space_members
  has_many :members, through: :space_members

  def all_spaces_have_tag?(name, bg_color)
    Tag.shared_tags(name, bg_color).pluck(:space_id).uniq.sort == Space.pluck(:id).sort
  end
end