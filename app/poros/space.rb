class Space
  attr_reader :id,
              :name,
              :color,
              :hidden,
              :statuses,
              :members
  
  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @color = data[:color]
    @hidden = data[:private]
    @statuses = data[:statuses].map { |status_data| Status.new(status_data) }
    @members = data[:members].map { |member_data| Member.new(member_data)}
  end
end