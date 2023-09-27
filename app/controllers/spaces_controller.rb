class SpacesController < ApplicationController
  def index
    @spaces = SpacesFacade.new.spaces
    # require 'pry'; binding.pry
  end
end