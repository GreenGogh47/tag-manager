class SpacesFacade
  attr_reader :spaces

  def initialize(team_id)
    @team_id = team_id
    @spaces = []
    load_spaces
  end

  private

  def load_spaces
    service = SpacesService.new.get_spaces(@team_id)

    service[:spaces].each do |space_data|
      @spaces << Space.new(space_data)
    end
  end
end