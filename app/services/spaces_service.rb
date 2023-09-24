class SpacesService
  def get_spaces(team_id)
    get_url("team/#{team_id}/space")
  end

  def get_url(url)
    response = connection.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.clickup.com/api/v2/") do |f|
      f.headers["Authorization"] = ENV["CLICKUP_API_KEY"]
    end
  end
end