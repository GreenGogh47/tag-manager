class SpacesFacade
  attr_reader :spaces

  def initialize(team_id, service)
    @team_id = team_id
    @service = service
    create_spaces
  end

  private

  def create_spaces
    spaces = @service.get_spaces(@team_id)
    spaces[:spaces].each do |space|
      new_space = Space.find_or_create_by!(id: space[:id].to_i) do |s|
        s.name = space[:name]
        s.color = space[:color]
        s.hidden = space[:private] ? "Private" : "Public"
        s.tags_enabled = space[:features][:tags][:enabled]
      end
      create_members_for_space(new_space, space[:members])
      create_statuses_for_space(new_space, space[:statuses])
      create_tags_for_space(new_space)
    end
  end

  def create_members_for_space(space, members_data)
    members_data.each do |member|
      new_member = Member.find_or_create_by!(id: member[:user][:id]) do |m|
        m.username = member[:user][:username]
        m.color = member[:user][:color]
        m.profile_picture = member[:user][:profilePicture]
        m.initials = member[:user][:initials]
      end
      SpaceMember.create!(space_id: space.id, member_id: new_member.id)
    end
  end

  def create_statuses_for_space(space, statuses_data)
    statuses_data.each do |status|
      Status.find_or_create_by!(c_id: status[:id], space_id: space.id) do |s|
        s.name = status[:status]
        s.orderindex = status[:orderindex]
        s.color = status[:color]
        s.space_id = space.id
      end
    end
  end

  def create_tags_for_space(space)
    tags = @service.get_tags(space.id)[:tags]
    tags.each do |tag|
      Tag.find_or_create_by!(name: tag[:name], space_id: space.id) do |t|
        t.tag_fg = tag[:tag_fg]
        t.tag_bg = tag[:tag_bg]
        t.creator = tag[:creator]
      end
    end
  end
end
