class RoomsController < ApplicationController
  
  def index
    @room = Room.where(user_id: current_user.id)
  end
  
  def new
    @room = Room.new
    
  end
  
  def show
    @room = Room.find_by(id: params[:id])
    @reservation = Reservation.new
  end
  
  def create
    @room = Room.new(room_params)
    @room.user = current_user
    if @room.save
      flash[:notice] = "ルーム登録が完了しました。"
      redirect_to("/")
    else
      render("/rooms/new")
    end
  end
  
  def search
    @room_area = Room.area_seach(params[:area])
    @room_keyword = Room.keyword_search(params[:keyword])
  end
  
  
  
  def room_params
    params.require(:room).permit(
          :name,
          :introduction,
          :fee,
          :address,
          :image
      )
  end
end
