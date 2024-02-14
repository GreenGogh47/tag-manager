class ClickupApiService
  # Base Connection
  def connection
    Faraday.new(url: "https://api.clickup.com/api/v2/") do |f|
      f.headers["Authorization"] = ENV["CLICKUP_API_KEY"]
    end
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  # Team ID
  def get_teams
    get_url("team")
  end

  def my_team_id
    @my_team_id ||= fetch_my_team_id
  end

  # Tags and Spaces
  def get_tags(space_id)
    get_url("space/#{space_id}/tag")
  end

  def get_spaces(team_id)
    x = get_url("team/#{team_id}/space")

  end

  private

  def fetch_my_team_id
    data = get_url("team")
    data[:teams].first[:id]
  end
end
