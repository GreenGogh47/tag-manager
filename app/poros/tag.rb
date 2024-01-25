class Tag
  attr_reader :name,
              :space_id,
              :tag_fg,
              :tag_bg,
              :creator

  def initialize(data)
    @name = data[:name]
    @space_id = data[:project_id]
    @tag_fg = data[:tag_fg]
    @tag_bg = data[:tag_bg]
    @creator = data[:creator]
  end
end