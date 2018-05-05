class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :destroy]

  def index
    @rooms = current_user.rooms
  end

  def new
    @room = Room.new
    @room.generate_key
  end

  def show

  end

  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      redirect_to rooms_path, notice: "Room: #{@room.name} created."
    else
      @room.generate_key
      render :new
    end
  end

  def destroy
    @room.destroy!
    redirect_to rooms_path, notice: "Room: #{@room.name} deleted."
  end

  private

  def room_params
    params.require(:room).permit(:name, :key)
  end

  def set_room
    @room = Room.find_by(key: params[:key])
  end

end
