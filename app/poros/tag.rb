class Tag
  attr_reader :name,
              :project_id,
              :tag_fg,
              :tag_bg,
              :creator

  def initialize(data)
    @name = data[:name]
    @project_id = data[:project_id]
    @tag_fg = data[:tag_fg]
    @tag_bg = data[:tag_bg]
    @creator = data[:creator]
  end
end