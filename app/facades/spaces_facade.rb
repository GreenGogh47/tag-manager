class SpacesFacade
  attr_reader :spaces

  def initialize(team_id)
    @team_id = team_id
    @service = ClickupApiService.new
    create_spaces
    require 'pry'; binding.pry
  end

  def shared_tags
    first_space_tags = @spaces.first.tags
    first_space_tags.select do |tag|
      @spaces.all? do |space|
        space.tags.any? do |space_tag|
          space_tag.name == tag.name && space_tag.tag_bg == tag.tag_bg
        end
      end
    end
  end

  def unique_tags(space)
    space_tags = space.tags
    space_tags.reject do |tag|
      @spaces.all? do |other_space|
        other_space.tags.any? do |space_tag|
          space_tag.name == tag.name && space_tag.tag_bg == tag.tag_bg
        end
      end
    end
  end

  private

  def create_spaces
    spaces = @service.get_spaces(@team_id)
    spaces[:spaces].each do |space|
      new_space = Space.create!(id: space[:id].to_i, name: space[:name], color: space[:color], hidden: space[:private], tags_enabled: space[:features][:tags][:enabled])
      create_members_for_space(new_space, space[:members])
      create_statuses_for_space(new_space, space[:statuses])
    end
  end

  def create_members_for_space(space, members_data)
    members_data.each do |member|
      new_member = Member.create!(id: member[:user][:id], username: member[:user][:username], color: member[:user][:color], profile_picture: member[:user][:profilePicture], initials: member[:user][:initials])
      SpaceMember.create!(space_id: space.id, member_id: new_member.id)
    end
  end

  def create_statuses_for_space(space, statuses_data)
    statuses_data.each do |status|
      Status.create!(name: status[:status], orderindex: status[:orderindex], color: status[:color], space_id: space.id)
    end
  end

  # def create_tags

  # end
end
