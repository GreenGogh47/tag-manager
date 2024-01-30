class SpacesController < ApplicationController
  def index
    service = ClickupApiService.new
    my_team = service.my_team_id
    @spaces = Space.all
    @shared_tags = Tag.shared_tags
    @unique_tags = Tag.unique_tags
  end
end
