class SpacesService < BaseService
  def get_spaces(team_id)
    get_url("team/#{team_id}/space")
  end
end