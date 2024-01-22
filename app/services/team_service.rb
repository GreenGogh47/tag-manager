class TeamService < BaseService
  def get_teams
    get_url("team")
  end

  def my_team_id
    @my_team_id ||= fetch_my_team_id
  end

  private

  def fetch_my_team_id
    data = get_url("team")
    data[:teams].first[:id]
  end
end
