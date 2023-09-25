class SpacesFacade
  service = SpacesService.new.get_spaces(ENV["MY_TEAM_ID"])

  service[:spaces].each do |space|
    Spaces.new(space)
  end
end