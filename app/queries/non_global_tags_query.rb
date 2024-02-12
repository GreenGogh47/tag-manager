class NonGlobalTagsQuery < ApplicationRecord

  def initialize(space)
    @space = space
  end

  def call
    # it's initializing with a space
  end
end