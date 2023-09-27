class TeamService < BaseService
  def get_teams
    get_url("team")
  end
end