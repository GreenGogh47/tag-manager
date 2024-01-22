class Status
  attr_reader :id,
              :name,
              :type,
              :orderindex,
              :color

  def initialize(data)
    @id = data[:id]
    @name = data[:status]
    @type = data[:type]
    @orderindex = data[:orderindex]
    @color = data[:color]
  end
end