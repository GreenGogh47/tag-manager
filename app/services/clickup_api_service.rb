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

  # Fetch Tags and Spaces
  def get_tags(space_id)
    get_url("space/#{space_id}/tag")
  end

  def get_spaces(team_id)
    get_url("team/#{team_id}/space")
  end

  # CRUD

  def update_tag(space_id, tag_name, tag_params)
    response = connection.put("space/#{space_id}/tag/#{tag_name}") do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { tag: tag_params }.to_json
    end

    handle_response(response)
  end

  private

  def fetch_my_team_id
    data = get_url("team")
    data[:teams].first[:id]
  end

  def handle_response(response)
    case response.status
    when 200...300
      JSON.parse(response.body, symbolize_names: true)
    when 400...600
      handle_error(response)
    else
      raise "Unexpected response status: #{response.status}"
    end
  end

  def handle_error(response)
    error_message = JSON.parse(response.body)["error"]
    raise "API error: #{error_message}"
  end
end
