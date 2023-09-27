class SpacesFacade
  attr_reader :spaces

  def initialize(team_id)
    @team_id = team_id
    @spaces = []
    load_spaces_and_tags
  end

  def shared_tags
    first_space_tags = @spaces.first.tags
    shared_tags = first_space_tags.select do |tag|
      @spaces.all? { |space| space.tags.any? { |space_tag| space_tag.name == tag.name && space_tag.tag_bg == tag.tag_bg } }
    end
    shared_tags
  end

  def unique_tags(space)
    space_tags = space.tags
    unique_tags = space_tags.reject do |tag|
      @spaces.all? { |other_space| other_space.tags.any? { |space_tag| space_tag.name == tag.name && space_tag.tag_bg == tag.tag_bg } }
    end
    unique_tags
  end
  

  private

  def load_spaces_and_tags
    space_service = SpacesService.new.get_spaces(@team_id)

    space_service[:spaces].each do |space_data|
      space = Space.new(space_data)
      tags = TagsFacade.new(space.id)
      space.tags = tags.tags
      @spaces << space
    end
  end
end