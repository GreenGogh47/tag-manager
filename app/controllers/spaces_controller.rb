class SpacesController < ApplicationController
  def index
    @spaces_facade = SpacesFacade.new
    # require 'pry'; binding.pry
  end
end