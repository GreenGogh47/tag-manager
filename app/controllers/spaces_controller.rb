class SpacesController < ApplicationController
  def index
    service = ClickupApiService.new
    my_team = service.my_team_id
    @spaces_facade = SpacesFacade.new(my_team, service)
    @spaces = Space.all
    @global_tags = Space.global_tags
  end
end
