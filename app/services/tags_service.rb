class TagsService < BaseService
  def get_tags(space_id)
    get_url("space/#{space_id}/tag")
  end
end