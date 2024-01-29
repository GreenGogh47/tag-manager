class SpacesFacade
  attr_reader :spaces

  def initialize(team_id)
    @team_id = team_id
    @service = ClickupApiService.new
    load_database
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

  def load_database
    create_spaces
  end

  def create_spaces
    spaces = @service.get_spaces(@team_id)
    spaces[:spaces].each do |space|
      new_space = Space.create!(id: space[:id].to_i, name: space[:name], color: space[:color], hidden: space[:private], tags_enabled: space[:features][:tags][:enabled])
      
      space[:members].each do |member|
        # currently only 1 member - see clickupapi "fetch_my_team_id"
        new_member = Member.create!(id: member[:user][:id], username: member[:user][:username], color: member[:user][:color], profile_picture: member[:user][:profilePicture], initials: member[:user][:initials])
        require 'pry'; binding.pry
        
      end
    end
  end

  # def create_members
    # spaces = @service.get_spaces(@team_id)
    # members = 
  # end

  # def create_space_members

  # end

  # def create_statuses

  # end

  # def create_tags

  # end
end
