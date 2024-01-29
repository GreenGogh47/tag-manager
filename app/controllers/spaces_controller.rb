class SpacesController < ApplicationController
  def index
    service = ClickupApiService.new
    my_team = service.my_team_id
    @spaces = SpacesFacade.new(my_team)
  end
end
