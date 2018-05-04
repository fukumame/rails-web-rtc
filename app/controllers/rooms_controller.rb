class RoomsController < ApplicationController

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
    @room.generate_key
  end

end
