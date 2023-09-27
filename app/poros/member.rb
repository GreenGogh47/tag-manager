class Member
  attr_reader :id,
              :username,
              :color,
              :profile_picture,
              :initials

  def initialize(data)
    @id = data[:user][:id]
    @username = data[:user][:username]
    @color = data[:user][:color]
    @profile_picture = data[:user][:profilePicture]
    @initials = data[:user][:initials]
  end
end