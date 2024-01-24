# # Make API calls for spaces and cache the information
# spaces_data = SpacesService.new.get_spaces(TeamService.new.my_team_id)
# cached_spaces = spaces_data[:spaces].map do |space_data|
#   space = Space.new(space_data)
#   tags = TagsFacade.new(space.id)
#   space.tags = tags.tags
#   space
# end

# # Save Tag models to the database
# cached_spaces.each do |space|
#   space.tags.each do |tag_data|
#     Tag.create(
#       name: tag_data.name,
#       project_id: tag_data.project_id,
#       tag_fg: tag_data.tag_fg,
#       tag_bg: tag_data.tag_bg,
#       creator: tag_data.creator
#     )
#   end
# end
