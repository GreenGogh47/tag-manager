class SpacesFacade
  attr_reader :spaces

  def initialize(team_id)
    purge_existing_database
    @team_id = team_id
    @service = ClickupApiService.new
    create_spaces
    require 'pry'; binding.pry
  end

  private

  def create_spaces
    spaces = @service.get_spaces(@team_id)
    spaces[:spaces].each do |space|
      new_space = Space.create!(id: space[:id].to_i, name: space[:name], color: space[:color], hidden: space[:private], tags_enabled: space[:features][:tags][:enabled])
      create_members_for_space(new_space, space[:members])
      create_statuses_for_space(new_space, space[:statuses])
      create_tags_for_space(new_space)
    end
  end

  def create_members_for_space(space, members_data)
    members_data.each do |member|
      new_member = Member.find_or_create_by!(id: member[:user][:id], username: member[:user][:username], color: member[:user][:color], profile_picture: member[:user][:profilePicture], initials: member[:user][:initials])
      SpaceMember.create!(space_id: space.id, member_id: new_member.id)
    end
  end

  def create_statuses_for_space(space, statuses_data)
    statuses_data.each do |status|
      Status.create!(name: status[:status], orderindex: status[:orderindex], color: status[:color], space_id: space.id)
    end
  end

  def create_tags_for_space(space)
    tags = @service.get_tags(space.id)[:tags]
    tags.each do |tag|
      Tag.create!(name: tag[:name], space_id: tag[:project_id].to_i, tag_fg: tag[:tag_fg], tag_bg: tag[:tag_bg], creator: tag[:creator])
    end
  end

  def purge_existing_database
    Tag.destroy_all
    Status.destroy_all
    Member.destroy_all
    SpaceMember.destroy_all
    Space.destroy_all
  end
end
