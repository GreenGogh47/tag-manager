class GlobalTagsQuery < ApplicationRecord

  def call
    tags = Tag.select("name, tag_bg")
      .group(:name, :tag_bg)
      .having("COUNT(DISTINCT space_id) = #{Space.distinct.count}")

    x = tags.map do |tag|
      OpenStruct.new(
        name: tag.name,
        tag_bg: tag.tag_bg
      )
      require 'pry'; binding.pry
  end
end