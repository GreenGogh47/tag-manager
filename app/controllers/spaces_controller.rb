class SpacesController < ApplicationController
  def index
    my_team = TeamService.new.my_team_id
    @spaces = SpacesFacade.new(my_team)
  end
end
