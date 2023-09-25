class SpacesFacade
attr_reader :spaces

  def initialize
    @spaces = []
    load_spaces
  end

  private
  
  def load_spaces
    service = SpacesService.new.get_spaces(ENV["MY_TEAM_ID"])

    service[:spaces].each do |space_data|
      @spaces << Space.new(space_data) # Create Space objects and add them to the array
    end
  end
end