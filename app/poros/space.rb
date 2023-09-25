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
    @statuses = data[:statuses]
    @members = data[:members]
  end
end