class Space
  attr_reader :id,
              :name,
              :color,
              :hidden,
              :tags_enabled,
              :statuses,
              :members
  
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @color = data[:color]
    @hidden = data[:private]
    @tags_enabled = data[:features][:tags][:enabled]
    @statuses = data[:statuses].map { |status_data| Status.new(status_data) }
    @members = data[:members].map { |member_data| Member.new(member_data)}
  end

  def hidden?
    hidden ? "Private" : "Public"
  end

  def all_members
    members.map { |member| member.username }.join(", ")
  end
end