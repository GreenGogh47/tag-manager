class Status
  attr_reader :id,
              :status,
              :type,
              :orderindex,
              :color
  
  def initialize(data)
    @id = data[:id]
    @status = data[:status]
    @type = data[:type]
    @orderindex = data[:orderindex]
    @color = data[:color]
  end
end