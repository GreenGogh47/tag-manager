class SpacesController < ApplicationController
  def index
    my_team = TeamService.new.get_my_team
    @spaces = SpacesFacade.new(my_team)
  end
end