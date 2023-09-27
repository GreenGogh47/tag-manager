class TagsService
  def get_tags(space_id)
    get_url("space/#{space_id}/tag")
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