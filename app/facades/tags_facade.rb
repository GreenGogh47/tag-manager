class TagsFacade
  attr_reader :tags

  def initialize(space_id)
    @space_id = space_id
    @tags = []
    load_tags
  end

  private

  def load_tags
    service = TagsService.new.get_tags(@space_id)

    service[:tags].each do |tag_data|
      @tags << Tag.new(tag_data)
    end
  end
end