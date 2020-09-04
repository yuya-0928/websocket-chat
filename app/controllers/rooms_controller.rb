class RoomsController < ApplicationController
  before_action :authenticate_user_talent, only: [:show]

  before_action :authenticate_talent!, only: [:new, :create]
  def new
    
  end
  def create
    room = Room.new(talent_id: current_talent.id)
    if room.save
      redirect_to root_path 
    else
      render :index
    end
  end
  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    @messages = @room.messages
    # @messages = Message.all
  end
end
